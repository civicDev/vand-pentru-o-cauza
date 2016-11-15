<?php

class ModelBeneficiarybeneficiaryGroup extends Model
{
    public function addbeneficiaryGroup($data)
    {
        $this->db->query('INSERT INTO '.DB_PREFIX."beneficiary_group SET  sort_order = '".(int) $data['sort_order']."',product_limit = '".(int) $data['product_limit']."' ,subscription_duration = '".(int) $data['subscription_duration']."' ,subscription_price = '".(int) $data['subscription_price']."', status = '".(int) $data['status']."'");

        $beneficiary_group_id = $this->db->getLastId();

        foreach ($data['beneficiary_group_description'] as $language_id => $value) {
            $this->db->query('INSERT INTO '.DB_PREFIX."beneficiary_group_description SET beneficiary_group_id = '".(int) $beneficiary_group_id."', language_id = '".(int) $language_id."', name = '".$this->db->escape($value['name'])."', description = '".$this->db->escape($value['description'])."'");
        }
        if (isset($data['beneficiary_commission'])) {
            foreach ($data['beneficiary_commission'] as $beneficiary_commission_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."commission_rate_to_beneficiary_group SET beneficiary_group_id = '".(int) $beneficiary_group_id."', commission_rate_id = '".(int) $beneficiary_commission_id."'");
            }
        }

        if (isset($data['beneficiary_group_category'])) {
            foreach ($data['beneficiary_group_category'] as $category_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."category_to_beneficiary_group SET beneficiary_group_id = '".(int) $beneficiary_group_id."', category_id = '".(int) $category_id."'");
            }
        }
    }

    public function editbeneficiaryGroup($beneficiary_group_id, $data)
    {
        $this->db->query('UPDATE '.DB_PREFIX."beneficiary_group SET sort_order = '".(int) $data['sort_order']."',product_limit = '".(int) $data['product_limit']."' ,subscription_duration = '".(int) $data['subscription_duration']."' ,subscription_price = '".(int) $data['subscription_price']."', status = '".(int) $data['status']."'WHERE beneficiary_group_id = '".(int) $beneficiary_group_id."'");

        $this->db->query('DELETE FROM '.DB_PREFIX."beneficiary_group_description WHERE beneficiary_group_id = '".(int) $beneficiary_group_id."'");

        foreach ($data['beneficiary_group_description'] as $language_id => $value) {
            $this->db->query('INSERT INTO '.DB_PREFIX."beneficiary_group_description SET beneficiary_group_id = '".(int) $beneficiary_group_id."', language_id = '".(int) $language_id."', name = '".$this->db->escape($value['name'])."', description = '".$this->db->escape($value['description'])."'");
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."commission_rate_to_beneficiary_group WHERE beneficiary_group_id = '".(int) $beneficiary_group_id."'");

        if (isset($data['beneficiary_commission'])) {
            foreach ($data['beneficiary_commission'] as $beneficiary_commission_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."commission_rate_to_beneficiary_group SET beneficiary_group_id = '".(int) $beneficiary_group_id."', commission_rate_id = '".(int) $beneficiary_commission_id."'");
            }
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."category_to_beneficiary_group WHERE beneficiary_group_id = '".(int) $beneficiary_group_id."'");

        if (isset($data['beneficiary_group_category'])) {
            foreach ($data['beneficiary_group_category'] as $category_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."category_to_beneficiary_group SET beneficiary_group_id = '".(int) $beneficiary_group_id."', category_id = '".(int) $category_id."'");
            }
        }
    }

    public function deletebeneficiaryGroup($beneficiary_group_id)
    {
        $this->db->query('DELETE FROM '.DB_PREFIX."beneficiary_group WHERE beneficiary_group_id = '".(int) $beneficiary_group_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."beneficiary_group_description WHERE beneficiary_group_id = '".(int) $beneficiary_group_id."'");
    }

    public function getbeneficiaryGroup($beneficiary_group_id)
    {
        $query = $this->db->query('SELECT DISTINCT * FROM '.DB_PREFIX.'beneficiary_group cg LEFT JOIN '.DB_PREFIX."beneficiary_group_description cgd ON (cg.beneficiary_group_id = cgd.beneficiary_group_id) WHERE cg.beneficiary_group_id = '".(int) $beneficiary_group_id."' AND cgd.language_id = '".(int) $this->config->get('config_language_id')."'");

        return $query->row;
    }

    public function getbeneficiaryGroups($data = array())
    {
        $sql = 'SELECT * FROM '.DB_PREFIX.'beneficiary_group cg LEFT JOIN '.DB_PREFIX."beneficiary_group_description cgd ON (cg.beneficiary_group_id = cgd.beneficiary_group_id) WHERE cgd.language_id = '".(int) $this->config->get('config_language_id')."'";

        $sort_data = array(
            'cgd.name',
            'cg.sort_order',
            'cg.status',
            'cg.subscription_duration',
            'cg.product_limit',
            'cg.subscription_price',
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= ' ORDER BY '.$data['sort'];
        } else {
            $sql .= ' ORDER BY cgd.name';
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= ' DESC';
        } else {
            $sql .= ' ASC';
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= ' LIMIT '.(int) $data['start'].','.(int) $data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getbeneficiaryGroupDescriptions($beneficiary_group_id)
    {
        $beneficiary_group_data = array();

        $query = $this->db->query('SELECT * FROM '.DB_PREFIX."beneficiary_group_description WHERE beneficiary_group_id = '".(int) $beneficiary_group_id."'");

        foreach ($query->rows as $result) {
            $beneficiary_group_data[$result['language_id']] = array(
                'name' => $result['name'],
                'description' => $result['description'],
            );
        }

        return $beneficiary_group_data;
    }

    public function getTotalbeneficiaryGroups()
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX.'beneficiary_group');

        return $query->row['total'];
    }

    public function getcommissions()
    {
        $query = $this->db->query('SELECT * FROM '.DB_PREFIX.'commission_rate ');

        return $query->rows;
    }

    public function getcommissionbeneficiarygroup($beneficiary_group_id)
    {
        $beneficiary_data = array();

        $query = $this->db->query('SELECT * FROM '.DB_PREFIX."commission_rate_to_beneficiary_group WHERE beneficiary_group_id = '".(int) $beneficiary_group_id."'");

        foreach ($query->rows as $result) {
            $beneficiary_data[] = $result['commission_rate_id'];
        }

        return $beneficiary_data;
    }

    public function getTotalStoresBybeneficiaryGroupId($beneficiary_group_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."setting WHERE `key` = 'config_beneficiary_group_id' AND `value` = '".(int) $beneficiary_group_id."' AND store_id != '0'");

        return $query->row['total'];
    }

    public function getbeneficiarygroupCategories($beneficiary_group_id)
    {
        $product_category_data = array();

        $query = $this->db->query('SELECT * FROM '.DB_PREFIX."category_to_beneficiary_group WHERE beneficiary_group_id = '".(int) $beneficiary_group_id."'");

        foreach ($query->rows as $result) {
            $product_category_data[] = $result['category_id'];
        }

        return $product_category_data;
    }
}
