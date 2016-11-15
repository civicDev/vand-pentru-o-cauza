<?php

class Modelbeneficiaryreviewbeneficiaryreview extends Model
{
    public function addbeneficiaryreview($data)
    {
        $this->event->trigger('pre.admin.beneficiaryreview.add', $data);

        $this->db->query('INSERT INTO '.DB_PREFIX."beneficiaryreview SET beneficiary_name = '".$this->db->escape($data['beneficiary_name'])."', beneficiary_id = '".(int) $data['beneficiary_id']."', text = '".$this->db->escape(strip_tags($data['text']))."', rating = '".(int) $data['rating']."', status = '".(int) $data['status']."', date_added = NOW()");

        $beneficiaryreview_id = $this->db->getLastId();

        $this->cache->delete('beneficiary');

        $this->event->trigger('post.admin.beneficiaryreview.add', $beneficiaryreview_id);

        return $beneficiaryreview_id;
    }

    public function editbeneficiaryreview($beneficiaryreview_id, $data)
    {
        $this->event->trigger('pre.admin.beneficiaryreview.edit', $data);

        $this->db->query('UPDATE '.DB_PREFIX."beneficiaryreview SET beneficiary_name = '".$this->db->escape($data['beneficiary_name'])."', beneficiary_id = '".(int) $data['beneficiary_id']."', text = '".$this->db->escape(strip_tags($data['text']))."', rating = '".(int) $data['rating']."', status = '".(int) $data['status']."', date_modified = NOW() WHERE beneficiaryreview_id = '".(int) $beneficiaryreview_id."'");

        $this->cache->delete('beneficiary');

        $this->event->trigger('post.admin.beneficiaryreview.edit', $beneficiaryreview_id);
    }

    public function deletebeneficiaryreview($beneficiaryreview_id)
    {
        $this->event->trigger('pre.admin.beneficiaryreview.delete', $beneficiaryreview_id);

        $this->db->query('DELETE FROM '.DB_PREFIX."beneficiaryreview WHERE beneficiaryreview_id = '".(int) $beneficiaryreview_id."'");

        $this->cache->delete('beneficiary');

        $this->event->trigger('post.admin.beneficiaryreview.delete', $beneficiaryreview_id);
    }

    public function getbeneficiaryreview($beneficiaryreview_id)
    {
        $query = $this->db->query("SELECT DISTINCT *, (SELECT CONCAT(pd.firstname, ' ', pd.lastname) AS title FROM ".DB_PREFIX.'customer pd WHERE pd.customer_id = r.beneficiary_id ) AS beneficiary FROM '.DB_PREFIX."beneficiaryreview r WHERE r.beneficiaryreview_id = '".(int) $beneficiaryreview_id."'");

        return $query->row;
    }

    public function getbeneficiaryreviews($data = array())
    {
        $sql = "SELECT r.beneficiaryreview_id, CONCAT(pd.firstname, ' ', pd.lastname) AS title, r.beneficiary_name, r.rating, r.status, r.date_added FROM ".DB_PREFIX.'beneficiaryreview r LEFT JOIN '.DB_PREFIX.'customer pd ON (r.beneficiary_id = pd.customer_id) LEFT JOIN '.DB_PREFIX.'customer_group_description cgd ON (pd.customer_group_id = cgd.customer_group_id) ';

        $sql .= " WHERE cgd.language_id = '".(int) $this->config->get('config_language_id')."'";

        if (!empty($data['filter_beneficiary'])) {
            $sql .= " AND CONCAT(pd.firstname, ' ', pd.lastname) LIKE '%".$this->db->escape($data['filter_beneficiary'])."%'";
        }

        if (!empty($data['filter_beneficiary_name'])) {
            $sql .= " AND r.beneficiary_name LIKE '%".$this->db->escape($data['filter_beneficiary_name'])."%'";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $sql .= " AND r.status = '".(int) $data['filter_status']."'";
        }

        if (!empty($data['filter_date_added'])) {
            $sql .= " AND DATE(r.date_added) = DATE('".$this->db->escape($data['filter_date_added'])."')";
        }

        $sort_data = array(
            'pd.firstname',
            'r.beneficiary_name',
            'r.rating',
            'r.status',
            'r.date_added',
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= ' ORDER BY '.$data['sort'];
        } else {
            $sql .= ' ORDER BY r.date_added';
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

    public function getTotalbeneficiaryreviews($data = array())
    {
        $sql = 'SELECT COUNT(*) AS total FROM '.DB_PREFIX.'beneficiaryreview r LEFT JOIN '.DB_PREFIX.'customer pd ON (r.beneficiary_id = pd.customer_id) ';

        if (!empty($data['filter_beneficiary'])) {
            $sql .= " AND CONCAT(pd.firstname, ' ', pd.lastname) LIKE '%".$this->db->escape($data['filter_beneficiary'])."%'";
        }

        if (!empty($data['filter_beneficiary_name'])) {
            $sql .= " AND r.beneficiary_name LIKE '%".$this->db->escape($data['filter_beneficiary_name'])."%'";
        }

        if (!empty($data['filter_status'])) {
            $sql .= " AND r.status = '".(int) $data['filter_status']."'";
        }

        if (!empty($data['filter_date_added'])) {
            $sql .= " AND DATE(r.date_added) = DATE('".$this->db->escape($data['filter_date_added'])."')";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getTotalbeneficiaryreviewsAwaitingApproval()
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."beneficiaryreview WHERE status = '0'");

        return $query->row['total'];
    }
}
