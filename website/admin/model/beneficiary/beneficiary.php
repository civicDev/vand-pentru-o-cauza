<?php

class ModelBeneficiarybeneficiary extends Model
{
    public function addbeneficiary($data)
    {
        $this->db->query('INSERT INTO '.DB_PREFIX."customer SET beneficiary_group_id = '".(int) $data['beneficiary_group_id']."', firstname = '".$this->db->escape($data['firstname'])."', lastname = '".$this->db->escape($data['lastname'])."', email = '".$this->db->escape($data['email'])."', telephone = '".$this->db->escape($data['telephone'])."', fax = '".$this->db->escape($data['fax'])."', newsletter = '".(int) $data['newsletter']."', salt = '".$this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9))."', password = '".$this->db->escape(sha1($salt.sha1($salt.sha1($data['password']))))."', status = '".(int) $data['status']."', safe = '".(int) $data['safe']."', date_added = NOW()");

        $beneficiary_id = $this->db->getLastId();

        if (isset($data['bankaccount'])) {
            foreach ($data['bankaccount'] as $bankaccount) {
                $this->db->query('INSERT INTO '.DB_PREFIX."bankaccount SET customer_id = '".(int) $beneficiary_id."', firstname = '".$this->db->escape($bankaccount['firstname'])."', lastname = '".$this->db->escape($bankaccount['lastname'])."', company_id = '".$this->db->escape($bankaccount['company_id'])."', bankaccount_1 = '".$this->db->escape($bankaccount['bankaccount_1'])."', bankaccount_2 = '".$this->db->escape($bankaccount['bankaccount_2'])."' , branch_id = '".$this->db->escape($bankaccount['branch_id'])."', bank_id = '".(int) $bankaccount['bank_id']."'");

                if (isset($bankaccount['default'])) {
                    $bankaccount_id = $this->db->getLastId();

                    $this->db->query('UPDATE '.DB_PREFIX."customer SET bankaccount_id = '".(int) $bankaccount_id."' WHERE customer_id = '".(int) $beneficiary_id."'");
                }
            }
        }

        if (isset($data['beneficiary_badge'])) {
            foreach ($data['beneficiary_badge'] as $beneficiary_group_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."badge_to_beneficiary SET beneficiary_id = '".(int) $beneficiary_id."', badge_id = '".(int) $beneficiary_group_id."'");
            }
        }
        if (isset($data['beneficiary_category'])) {
            foreach ($data['beneficiary_category'] as $category_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."category_to_beneficiary SET beneficiary_id = '".(int) $beneficiary_id."', category_id = '".(int) $category_id."'");
            }
        }
    }

    public function addtobeneficiary($beneficiary_group_id, $beneficiary_id)
    {
        $beneficiary_info = $this->getbeneficiary($beneficiary_id);

        if ($beneficiary_info) {
            $this->db->query('UPDATE '.DB_PREFIX."customer SET beneficiary_group_id = '".(int) $beneficiary_group_id."' , beneficiary_date_added = NOW() WHERE customer_id = '".(int) $beneficiary_id."'");
        }
    }

    public function editbeneficiary($beneficiary_id, $data)
    {
        $this->db->query('UPDATE '.DB_PREFIX."customer SET beneficiary_group_id = '".(int) $data['beneficiary_group_id']."', firstname = '".$this->db->escape($data['firstname'])."', lastname = '".$this->db->escape($data['lastname'])."', email = '".$this->db->escape($data['email'])."', telephone = '".$this->db->escape($data['telephone'])."', fax = '".$this->db->escape($data['fax'])."', newsletter = '".(int) $data['newsletter']."', status = '".(int) $data['status']."', safe = '".(int) $data['safe']."' WHERE customer_id = '".(int) $beneficiary_id."'");

        if ($data['password']) {
            $this->db->query('UPDATE '.DB_PREFIX."customer SET salt = '".$this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9))."', password = '".$this->db->escape(sha1($salt.sha1($salt.sha1($data['password']))))."' WHERE customer_id = '".(int) $beneficiary_id."'");
        }

        $this->db->query('DELETE FROM '.DB_PREFIX."bankaccount WHERE customer_id = '".(int) $beneficiary_id."'");

        if (isset($data['bankaccount'])) {
            foreach ($data['bankaccount'] as $bankaccount) {
                $this->db->query('INSERT INTO '.DB_PREFIX."bankaccount SET bankaccount_id = '".(int) $bankaccount['bankaccount_id']."', customer_id = '".(int) $beneficiary_id."', firstname = '".$this->db->escape($bankaccount['firstname'])."', lastname = '".$this->db->escape($bankaccount['lastname'])."', company_id = '".$this->db->escape($bankaccount['company_id'])."', bankaccount_1 = '".$this->db->escape($bankaccount['bankaccount_1'])."', bankaccount_2 = '".$this->db->escape($bankaccount['bankaccount_2'])."' , branch_id = '".$this->db->escape($bankaccount['branch_id'])."', bank_id = '".(int) $bankaccount['bank_id']."'");

                if (isset($bankaccount['default'])) {
                    $bankaccount_id = $this->db->getLastId();

                    $this->db->query('UPDATE '.DB_PREFIX."customer SET bankaccount_id = '".(int) $bankaccount_id."' WHERE customer_id = '".(int) $beneficiary_id."'");
                }
            }
        }
        $this->db->query('DELETE FROM '.DB_PREFIX."badge_to_beneficiary WHERE beneficiary_id = '".(int) $beneficiary_id."'");

        if (isset($data['beneficiary_badge'])) {
            foreach ($data['beneficiary_badge'] as $beneficiary_group_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."badge_to_beneficiary SET beneficiary_id = '".(int) $beneficiary_id."', badge_id = '".(int) $beneficiary_group_id."'");
            }
        }
        $this->db->query('DELETE FROM '.DB_PREFIX."category_to_beneficiary WHERE beneficiary_id = '".(int) $beneficiary_id."'");

        if (isset($data['beneficiary_category'])) {
            foreach ($data['beneficiary_category'] as $category_id) {
                $this->db->query('INSERT INTO '.DB_PREFIX."category_to_beneficiary SET beneficiary_id = '".(int) $beneficiary_id."', category_id = '".(int) $category_id."', status ='1'");
            }
        }
    }

    public function editToken($beneficiary_id, $token)
    {
        $this->db->query('UPDATE '.DB_PREFIX."customer SET token = '".$this->db->escape($token)."' WHERE customer_id = '".(int) $beneficiary_id."'");
    }

    public function deletebeneficiary($beneficiary_id)
    {
        $this->db->query('UPDATE '.DB_PREFIX."customer SET beneficiary_group_id = '0' ,  beneficiary_approved = '0' ,beneficiary_changegroup = '0'WHERE customer_id = '".(int) $beneficiary_id."'");
        $this->db->query('DELETE FROM '.DB_PREFIX."category_to_beneficiary WHERE beneficiary_id = '".(int) $beneficiary_id."'");
    }

    public function getbeneficiary($beneficiary_id)
    {
        $query = $this->db->query('SELECT DISTINCT * FROM '.DB_PREFIX."customer WHERE customer_id = '".(int) $beneficiary_id."'");

        return $query->row;
    }

    public function getbeneficiaryByEmail($email)
    {
        $query = $this->db->query('SELECT DISTINCT * FROM '.DB_PREFIX."customer WHERE LCASE(email) = '".$this->db->escape(utf8_strtolower($email))."'");

        return $query->row;
    }

    public function getbeneficiarys($data = array())
    {
        $sql = "SELECT *, CONCAT(c.firstname, ' ', c.lastname) AS name, cgd.name AS beneficiary_group
        FROM ".DB_PREFIX.'customer c
        LEFT JOIN '.DB_PREFIX.'beneficiary_group_description cgd
        ON (c.beneficiary_group_id = cgd.beneficiary_group_id)
        LEFT JOIN
        (
        SELECT *,COUNT(pts.beneficiary_id) AS product_total FROM '.DB_PREFIX."product_to_beneficiary pts
        GROUP BY pts.beneficiary_id
        ) pts
        ON (c.customer_id = pts.beneficiary_id)
        WHERE cgd.language_id = '".(int) $this->config->get('config_language_id')."'";

        $implode = array();

        if (!empty($data['filter_name'])) {
            $implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE '%".$this->db->escape($data['filter_name'])."%'";
        }

        if (!empty($data['filter_email'])) {
            $implode[] = "c.email LIKE '%".$this->db->escape($data['filter_email'])."%'";
        }

        if (isset($data['filter_newsletter']) && $data['filter_newsletter'] !== null) {
            $implode[] = "c.newsletter = '".(int) $data['filter_newsletter']."'";
        }

        if (!empty($data['filter_beneficiary_group_id'])) {
            $implode[] = "c.beneficiary_group_id = '".(int) $data['filter_beneficiary_group_id']."'";
        }

        if (!empty($data['filter_ip'])) {
            $implode[] = 'c.customer_id IN (SELECT customer_id FROM '.DB_PREFIX."customer_ip WHERE ip = '".$this->db->escape($data['filter_ip'])."')";
        }

        if (isset($data['filter_status']) && $data['filter_status'] !== null) {
            $implode[] = "c.status = '".(int) $data['filter_status']."'";
        }

        if (isset($data['filter_beneficiary_approved']) && $data['filter_beneficiary_approved'] !== null) {
            $implode[] = "c.beneficiary_approved = '".(int) $data['filter_beneficiary_approved']."'";
        }

        if (!empty($data['filter_date_added'])) {
            $implode[] = "DATE(c.beneficiary_date_added) = DATE('".$this->db->escape($data['filter_date_added'])."')";
        }

        if ($implode) {
            $sql .= ' AND '.implode(' AND ', $implode);
        }

        $sort_data = array(
            'name',
            'c.email',
            'beneficiary_group',
            'pts.beneficiary_id',
            'c.status',
            'c.beneficiary_approved',
            'c.ip',
            'c.beneficiary_date_added',
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= ' ORDER BY '.$data['sort'];
        } else {
            $sql .= ' ORDER BY name';
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

    public function getbeneficiarygroup($beneficiary_group_id)
    {
        $query = $this->db->query('SELECT * FROM '.DB_PREFIX."beneficiary_group_description WHERE beneficiary_group_id = '".$beneficiary_group_id."' AND language_id = '".(int) $this->config->get('config_language_id')."'");

        return $query->row;
    }

    public function getbeneficiarygroupIdBybeneficiaryId($beneficiary_id)
    {
        $query = $this->db->query('SELECT * FROM '.DB_PREFIX.'customer c 
		LEFT JOIN '.DB_PREFIX.'beneficiary_group sg ON (c.beneficiary_group_id = sg.beneficiary_group_id)
		LEFT JOIN '.DB_PREFIX."beneficiary_group_description sgd ON (c.beneficiary_group_id = sgd.beneficiary_group_id)
		 WHERE c.customer_id =  '".$beneficiary_id."' 
		 
		 AND sgd.language_id = '".(int) $this->config->get('config_language_id')."'");

        return $query->row;
    }

    public function getbeneficiarygroupIdRequsetBybeneficiaryId($beneficiary_id)
    {
        $query = $this->db->query('		
		SELECT sgd.name FROM '.DB_PREFIX.'customer c 
		LEFT JOIN '.DB_PREFIX.'beneficiary_group sg ON (c.beneficiary_changegroup = sg.beneficiary_group_id)
		LEFT JOIN '.DB_PREFIX."beneficiary_group_description sgd ON (c.beneficiary_changegroup = sgd.beneficiary_group_id)
		WHERE c.customer_id =  '".$beneficiary_id."' 
		AND sgd.language_id = '".(int) $this->config->get('config_language_id')."'");

        return $query->row;
    }

    public function approve($beneficiary_id)
    {
        $beneficiary_info = $this->getbeneficiary($beneficiary_id);

        if ($beneficiary_info) {
            $this->db->query('UPDATE '.DB_PREFIX."customer SET beneficiary_approved = '1' ,beneficiary_date_added = NOW() WHERE customer_id = '".(int) $beneficiary_id."'");

            $this->db->query('UPDATE '.DB_PREFIX."category_to_beneficiary SET status = '1' WHERE beneficiary_id = '".(int) $beneficiary_id."'");

            $this->load->language('beneficiary/mail_beneficiary');

            $this->load->model('setting/store');

            $store_info = $this->model_setting_store->getStore($beneficiary_info['store_id']);

            if ($store_info) {
                $store_name = $store_info['name'];
                $store_url = $store_info['url'].'index.php?route=account/login';
            } else {
                $store_name = $this->config->get('config_name');
                $store_url = HTTP_CATALOG.'index.php?route=beneficiaryprofile/beneficiaryprofile';
            }

            $message = sprintf($this->language->get('text_approve_welcome'), $store_name)."\n\n";
            $message .= $this->language->get('text_approve_login')."\n";
            $message .= $store_url."\n\n";
            $message .= $this->language->get('text_approve_services')."\n\n";
            $message .= $this->language->get('text_approve_thanks')."\n";
            $message .= $store_name;

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
            $mail->setTo($beneficiary_info['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($store_name);
            $mail->setSubject(sprintf($this->language->get('text_approve_subject'), $store_name));
            $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
            $mail->send();
        }
    }

    public function upgrade_beneficiarygroup($beneficiary_id)
    {
        $beneficiary_info = $this->getbeneficiary($beneficiary_id);

        if ($beneficiary_info) {
            $this->db->query('UPDATE '.DB_PREFIX.'customer SET beneficiary_group_id = (
			SELECT beneficiary_changegroup from (SELECT * from '.DB_PREFIX."customer ) as x WHERE customer_id = '".(int) $beneficiary_id."'
			) WHERE customer_id = '".(int) $beneficiary_id."'");

            $this->db->query('UPDATE '.DB_PREFIX."customer SET beneficiary_changegroup = '0' WHERE customer_id = '".(int) $beneficiary_id."'");

            $this->load->language('beneficiary/mail_beneficiary');

            $this->load->model('setting/store');

            $store_info = $this->model_setting_store->getStore($beneficiary_info['store_id']);

            if ($store_info) {
                $store_name = $store_info['name'];
                $store_url = $store_info['url'].'index.php?route=account/login';
            } else {
                $store_name = $this->config->get('config_name');
                $store_url = HTTP_CATALOG.'index.php?route=account/login';
            }

            $message = sprintf($this->language->get('text_upgrade_welcome'), $store_name)."\n\n";
            $message .= $this->language->get('text_upgrade_login')."\n";
            $message .= $store_url."\n\n";
            $message .= $this->language->get('text_upgrade_services')."\n\n";
            $message .= $this->language->get('text_upgrade_thanks')."\n";
            $message .= $store_name;

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
            $mail->setTo($beneficiary_info['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($store_name);
            $mail->setSubject(sprintf($this->language->get('text_upgrade_subject'), $store_name));
            $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
            $mail->send();
        }
    }

    public function disapprove($beneficiary_id)
    {
        $beneficiary_info = $this->getbeneficiary($beneficiary_id);

        if ($beneficiary_info) {
            $this->db->query('UPDATE '.DB_PREFIX."customer SET beneficiary_approved = '0' WHERE customer_id = '".(int) $beneficiary_id."'");

            $this->load->language('beneficiary/mail_beneficiary');

            $this->load->model('setting/store');

            $store_info = $this->model_setting_store->getStore($beneficiary_info['store_id']);

            if ($store_info) {
                $store_name = $store_info['name'];
                $store_url = $store_info['url'].'index.php?route=account/login';
            } else {
                $store_name = $this->config->get('config_name');
                $store_url = HTTP_CATALOG.'index.php?route=account/login';
            }

            $message = $this->language->get('text_disapprove_login')."\n";
            $message .= $store_url."\n\n";

            $message .= $this->language->get('text_disapprove_thanks')."\n";
            $message .= $store_name;

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
            $mail->setTo($beneficiary_info['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($store_name);
            $mail->setSubject(sprintf($this->language->get('text_disapprove_subject'), $store_name));
            $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
            $mail->send();
        }
    }

    public function getbankaccount($bankaccount_id)
    {
        $bankaccount_query = $this->db->query('SELECT * FROM '.DB_PREFIX."bankaccount WHERE bankaccount_id = '".(int) $bankaccount_id."'");

        if ($bankaccount_query->num_rows) {
            return array(
                'bankaccount_id' => $bankaccount_query->row['bankaccount_id'],
                'beneficiary_id' => $bankaccount_query->row['customer_id'],
                'firstname' => $bankaccount_query->row['firstname'],
                'lastname' => $bankaccount_query->row['lastname'],
                'company_id' => $bankaccount_query->row['company_id'],
                'branch_id' => $bankaccount_query->row['branch_id'],
                'bankaccount_1' => $bankaccount_query->row['bankaccount_1'],
                'bank_id' => $bankaccount_query->row['bank_id'],
                'bankaccount_2' => $bankaccount_query->row['bankaccount_2'],

            );
        }
    }

    public function getbankaccounts($beneficiary_id)
    {
        $bankaccount_data = array();

        $query = $this->db->query('SELECT bankaccount_id FROM '.DB_PREFIX."bankaccount WHERE customer_id = '".(int) $beneficiary_id."'");

        foreach ($query->rows as $result) {
            $bankaccount_info = $this->getbankaccount($result['bankaccount_id']);

            if ($bankaccount_info) {
                $bankaccount_data[$result['bankaccount_id']] = $bankaccount_info;
            }
        }

        return $bankaccount_data;
    }

    public function getTotalbeneficiarys($data = array())
    {
        $sql = 'SELECT COUNT(*) AS total FROM '.DB_PREFIX.'customer';

        $implode = array();

        if (!empty($data['filter_name'])) {
            $implode[] = "CONCAT(firstname, ' ', lastname) LIKE '%".$this->db->escape($data['filter_name'])."%'";
        }

        if (!empty($data['filter_email'])) {
            $implode[] = "email LIKE '%".$this->db->escape($data['filter_email'])."%'";
        }

        if (isset($data['filter_newsletter']) && $data['filter_newsletter'] !== null) {
            $implode[] = "newsletter = '".(int) $data['filter_newsletter']."'";
        }

        if (!empty($data['filter_beneficiary_group_id'])) {
            $implode[] = "beneficiary_group_id = '".(int) $data['filter_beneficiary_group_id']."'";
        }

        if (!empty($data['filter_ip'])) {
            $implode[] = 'customer_id IN (SELECT customer_id FROM '.DB_PREFIX."customer_ip WHERE ip = '".$this->db->escape($data['filter_ip'])."')";
        }

        if (isset($data['filter_status']) && $data['filter_status'] !== null) {
            $implode[] = "status = '".(int) $data['filter_status']."'";
        }

        if (isset($data['filter_beneficiary_approved']) && $data['filter_beneficiary_approved'] !== null) {
            $implode[] = "beneficiary_approved = '".(int) $data['filter_beneficiary_approved']."'";
            $implode[] = "beneficiary_group_id != '0'";
        }

        if (!empty($data['filter_date_added'])) {
            $implode[] = "DATE(date_added) = DATE('".$this->db->escape($data['filter_date_added'])."')";
        }

        $implode[] = "beneficiary_group_id != '0'";

        if ($implode) {
            $sql .= ' WHERE '.implode(' AND ', $implode);
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getTotalbeneficiarysAwaitingApproval()
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."customer WHERE status = '0' OR beneficiary_approved = '0'");

        return $query->row['total'];
    }

    public function getTotalbankaccountsBybeneficiaryId($beneficiary_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."bankaccount WHERE customer_id = '".(int) $beneficiary_id."'");

        return $query->row['total'];
    }

    public function getTotalbankaccountsByCountryId($country_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."bankaccount WHERE country_id = '".(int) $country_id."'");

        return $query->row['total'];
    }

    public function getTotalbankaccountsByZoneId($zone_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."bankaccount WHERE zone_id = '".(int) $zone_id."'");

        return $query->row['total'];
    }

    public function getTotalbeneficiarysBybeneficiaryGroupId($beneficiary_group_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."customer WHERE beneficiary_group_id = '".(int) $beneficiary_group_id."'");

        return $query->row['total'];
    }

    public function addHistory($beneficiary_id, $comment)
    {
        $this->db->query('INSERT INTO '.DB_PREFIX."customer_history SET customer_id = '".(int) $beneficiary_id."', comment = '".$this->db->escape(strip_tags($comment))."', date_added = NOW()");
    }

    public function getHistories($beneficiary_id, $start = 0, $limit = 10)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }

        $query = $this->db->query('SELECT comment, date_added FROM '.DB_PREFIX."customer_history WHERE customer_id = '".(int) $beneficiary_id."' ORDER BY date_added DESC LIMIT ".(int) $start.','.(int) $limit);

        return $query->rows;
    }

    public function getTotalHistories($beneficiary_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."customer_history WHERE customer_id = '".(int) $beneficiary_id."'");

        return $query->row['total'];
    }

    public function addTransaction($beneficiary_id, $description = '', $amount = '', $order_id = 0)
    {
        $beneficiary_info = $this->getbeneficiary($beneficiary_id);

        if ($beneficiary_info) {
            $this->db->query('INSERT INTO '.DB_PREFIX."beneficiary_transaction SET customer_id = '".(int) $beneficiary_id."', order_id = '".(int) $order_id."', description = '".$this->db->escape($description)."', amount = '".(float) $amount."', date_added = NOW()");

            $this->load->language('beneficiary/mail_beneficiary');

            $this->load->model('setting/store');

            $store_info = $this->model_setting_store->getStore($beneficiary_info['store_id']);

            if ($store_info) {
                $store_name = $store_info['name'];
            } else {
                $store_name = $this->config->get('config_name');
            }

            $message = sprintf($this->language->get('text_transaction_received'), $this->currency->format($amount, $this->config->get('config_currency')))."\n\n";
            $message .= sprintf($this->language->get('text_transaction_total'), $this->currency->format($this->getTransactionTotal($beneficiary_id)));

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
            $mail->setTo($beneficiary_info['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($store_name);
            $mail->setSubject(sprintf($this->language->get('text_transaction_subject'), $this->config->get('config_name')));
            $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
            $mail->send();
        }
    }

    public function deleteTransaction($order_id)
    {
        $this->db->query('DELETE FROM '.DB_PREFIX."beneficiary_transaction WHERE order_id = '".(int) $order_id."'");
    }

    public function getTransactions($beneficiary_id, $start = 0, $limit = 10)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }

        $query = $this->db->query('SELECT * FROM '.DB_PREFIX."beneficiary_transaction WHERE customer_id = '".(int) $beneficiary_id."' ORDER BY date_added DESC LIMIT ".(int) $start.','.(int) $limit);

        return $query->rows;
    }

    public function getTotalTransactions($beneficiary_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total  FROM '.DB_PREFIX."beneficiary_transaction WHERE customer_id = '".(int) $beneficiary_id."'");

        return $query->row['total'];
    }

    public function getTransactionTotal($beneficiary_id)
    {
        $query = $this->db->query('SELECT SUM(amount) AS total FROM '.DB_PREFIX."beneficiary_transaction WHERE customer_id = '".(int) $beneficiary_id."'");

        return $query->row['total'];
    }

    public function getTotalTransactionsByOrderId($order_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."beneficiary_transaction WHERE order_id = '".(int) $order_id."'");

        return $query->row['total'];
    }

    public function addReward($beneficiary_id, $description = '', $points = '', $order_id = 0)
    {
        $beneficiary_info = $this->getbeneficiary($beneficiary_id);

        if ($beneficiary_info) {
            $this->db->query('INSERT INTO '.DB_PREFIX."customer_reward SET customer_id = '".(int) $beneficiary_id."', order_id = '".(int) $order_id."', points = '".(int) $points."', description = '".$this->db->escape($description)."', date_added = NOW()");

            $this->load->language('beneficiary/mail_beneficiary');

            $this->load->model('setting/store');

            $store_info = $this->model_setting_store->getStore($beneficiary_info['store_id']);

            if ($store_info) {
                $store_name = $store_info['name'];
            } else {
                $store_name = $this->config->get('config_name');
            }

            $message = sprintf($this->language->get('text_reward_received'), $points)."\n\n";
            $message .= sprintf($this->language->get('text_reward_total'), $this->getRewardTotal($beneficiary_id));

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
            $mail->setTo($beneficiary_info['email']);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($store_name);
            $mail->setSubject(sprintf($this->language->get('text_reward_subject'), $store_name));
            $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
            $mail->send();
        }
    }

    public function deleteReward($order_id)
    {
        $this->db->query('DELETE FROM '.DB_PREFIX."customer_reward WHERE order_id = '".(int) $order_id."' AND points > 0");
    }

    public function getRewards($beneficiary_id, $start = 0, $limit = 10)
    {
        $query = $this->db->query('SELECT * FROM '.DB_PREFIX."customer_reward WHERE customer_id = '".(int) $beneficiary_id."' ORDER BY date_added DESC LIMIT ".(int) $start.','.(int) $limit);

        return $query->rows;
    }

    public function getTotalRewards($beneficiary_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."customer_reward WHERE customer_id = '".(int) $beneficiary_id."'");

        return $query->row['total'];
    }

    public function getRewardTotal($beneficiary_id)
    {
        $query = $this->db->query('SELECT SUM(points) AS total FROM '.DB_PREFIX."customer_reward WHERE customer_id = '".(int) $beneficiary_id."'");

        return $query->row['total'];
    }

    public function getTotalbeneficiaryRewardsByOrderId($order_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."customer_reward WHERE order_id = '".(int) $order_id."'");

        return $query->row['total'];
    }

    public function getIps($beneficiary_id)
    {
        $query = $this->db->query('SELECT * FROM '.DB_PREFIX."customer_ip WHERE customer_id = '".(int) $beneficiary_id."'");

        return $query->rows;
    }

    public function getTotalIps($beneficiary_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."customer_ip WHERE customer_id = '".(int) $beneficiary_id."'");

        return $query->row['total'];
    }

    public function getTotalbeneficiarysByIp($ip)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."customer_ip WHERE ip = '".$this->db->escape($ip)."'");

        return $query->row['total'];
    }

    public function addBanIp($ip)
    {
        $this->db->query('INSERT INTO `'.DB_PREFIX."customer_ban_ip` SET `ip` = '".$this->db->escape($ip)."'");
    }

    public function removeBanIp($ip)
    {
        $this->db->query('DELETE FROM `'.DB_PREFIX."customer_ban_ip` WHERE `ip` = '".$this->db->escape($ip)."'");
    }

    public function getTotalBanIpsByIp($ip)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM `'.DB_PREFIX."customer_ban_ip` WHERE `ip` = '".$this->db->escape($ip)."'");

        return $query->row['total'];
    }

    public function getCustomers($data = array())
    {
        $sql = "SELECT *, CONCAT(c.firstname, ' ', c.lastname) AS name
		FROM ".DB_PREFIX."customer c 
		
		WHERE c.beneficiary_group_id = '0' ";

        $implode = array();

        if (!empty($data['filter_name'])) {
            $implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE '%".$this->db->escape($data['filter_name'])."%'";
        }

        if (!empty($data['filter_email'])) {
            $implode[] = "c.email LIKE '%".$this->db->escape($data['filter_email'])."%'";
        }

        if (isset($data['filter_newsletter']) && $data['filter_newsletter'] !== null) {
            $implode[] = "c.newsletter = '".(int) $data['filter_newsletter']."'";
        }

        if (!empty($data['filter_customer_group_id'])) {
            $implode[] = "c.beneficiary_changegroup = '".(int) $data['filter_customer_group_id']."'";
        }

        if (!empty($data['filter_ip'])) {
            $implode[] = 'c.customer_id IN (SELECT customer_id FROM '.DB_PREFIX."customer_ip WHERE ip = '".$this->db->escape($data['filter_ip'])."')";
        }

        if (isset($data['filter_status']) && $data['filter_status'] !== null) {
            $implode[] = "c.status = '".(int) $data['filter_status']."'";
        }

        if (isset($data['filter_approved']) && $data['filter_approved'] !== null) {
            $implode[] = "c.approved = '".(int) $data['filter_approved']."'";
        }

        if (!empty($data['filter_date_added'])) {
            $implode[] = "DATE(c.date_added) = DATE('".$this->db->escape($data['filter_date_added'])."')";
        }

        if ($implode) {
            $sql .= ' AND '.implode(' AND ', $implode);
        }

        $sort_data = array(
            'name',
            'c.email',
            'customer_group',
            'c.status',
            'c.approved',
            'c.ip',
            'c.date_added',
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= ' ORDER BY '.$data['sort'];
        } else {
            $sql .= ' ORDER BY name';
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

    public function getTotalCustomers($data = array())
    {
        $sql = 'SELECT COUNT(*) AS total FROM '.DB_PREFIX."customer WHERE beneficiary_group_id = '0' ";

        $implode = array();

        if (!empty($data['filter_name'])) {
            $implode[] = "CONCAT(firstname, ' ', lastname) LIKE '%".$this->db->escape($data['filter_name'])."%'";
        }

        if (!empty($data['filter_email'])) {
            $implode[] = "email LIKE '%".$this->db->escape($data['filter_email'])."%'";
        }

        if (isset($data['filter_newsletter']) && $data['filter_newsletter'] !== null) {
            $implode[] = "newsletter = '".(int) $data['filter_newsletter']."'";
        }

        if (!empty($data['filter_customer_group_id'])) {
            $implode[] = "customer_group_id = '".(int) $data['filter_customer_group_id']."'";
        }

        if (!empty($data['filter_ip'])) {
            $implode[] = 'customer_id IN (SELECT customer_id FROM '.DB_PREFIX."customer_ip WHERE ip = '".$this->db->escape($data['filter_ip'])."')";
        }

        if (isset($data['filter_status']) && $data['filter_status'] !== null) {
            $implode[] = "status = '".(int) $data['filter_status']."'";
        }

        if (isset($data['filter_approved']) && $data['filter_approved'] !== null) {
            $implode[] = "beneficiary_approved = '".(int) $data['filter_approved']."'";
        }

        if (!empty($data['filter_date_added'])) {
            $implode[] = "DATE(date_added) = DATE('".$this->db->escape($data['filter_date_added'])."')";
        }

        if ($implode) {
            $sql .= ' AND '.implode(' AND ', $implode);
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getbadges()
    {
        $query = $this->db->query('SELECT * FROM '.DB_PREFIX."badge_description  WHERE language_id = '".(int) $this->config->get('config_language_id')."'");

        return $query->rows;
    }

    public function getbadgebeneficiary($beneficiary_id)
    {
        $beneficiary_data = array();

        $query = $this->db->query('SELECT * FROM '.DB_PREFIX."badge_to_beneficiary WHERE beneficiary_id = '".(int) $beneficiary_id."'");

        foreach ($query->rows as $result) {
            $beneficiary_data[] = $result['badge_id'];
        }

        return $beneficiary_data;
    }

    public function getProducts($beneficiary_id, $start = 0, $limit = 10)
    {
        if ($start < 0) {
            $start = 0;
        }

        if ($limit < 1) {
            $limit = 10;
        }
        $sql = '
		SELECT * FROM '.DB_PREFIX.'product p 
		LEFT JOIN '.DB_PREFIX.'product_description pd 
		ON (p.product_id = pd.product_id)
		LEFT JOIN '.DB_PREFIX."product_to_beneficiary pts 
		ON (p.product_id = pts.product_id)
		WHERE pd.language_id = '".(int) $this->config->get('config_language_id')."'";

        $sql .= " AND pts.beneficiary_id ='".(int) $beneficiary_id."' ";

        $sql .= ' GROUP BY p.product_id';

        $sql .= ' LIMIT '.(int) $start.','.(int) $limit;
        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getTotalProducts($beneficiary_id)
    {
        $sql = 'SELECT COUNT(DISTINCT p.product_id) AS total FROM '.DB_PREFIX.'product p 
		LEFT JOIN '.DB_PREFIX.'product_description pd ON (p.product_id = pd.product_id)
		LEFT JOIN '.DB_PREFIX.'product_to_beneficiary pts ON (p.product_id = pts.product_id) 

		';

        $sql .= " WHERE pd.language_id = '".(int) $this->config->get('config_language_id')."'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND pd.name LIKE '%".$this->db->escape($data['filter_name'])."%'";
        }

        if (!empty($data['filter_model'])) {
            $sql .= " AND p.model LIKE '%".$this->db->escape($data['filter_model'])."%'";
        }

        if (!empty($data['filter_price'])) {
            $sql .= " AND p.price LIKE '%".$this->db->escape($data['filter_price'])."%'";
        }

        if (isset($data['filter_quantity']) && $data['filter_quantity'] !== null) {
            $sql .= " AND p.quantity = '".(int) $data['filter_quantity']."'";
        }

        if (isset($data['filter_status']) && $data['filter_status'] !== null) {
            $sql .= " AND p.status = '".(int) $data['filter_status']."'";
        }

        $sql .= " AND pts.beneficiary_id = '".(int) $beneficiary_id."'";

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getbeneficiaryproducts($beneficiary_id)
    {
        $beneficiary_data = array();

        $query = $this->db->query('SELECT * FROM '.DB_PREFIX."product_to_beneficiary WHERE beneficiary_id = '".(int) $beneficiary_id."'");

        foreach ($query->rows as $result) {
            $beneficiary_data[] = $result['product_id'];
        }

        return $beneficiary_data;
    }

    public function addbeneficiaryproduct($beneficiary_id, $product_id)
    {
        $this->db->query('DELETE FROM `'.DB_PREFIX."product_to_beneficiary` WHERE `product_id` = '".$product_id."'");

        $this->db->query('INSERT INTO '.DB_PREFIX."product_to_beneficiary SET beneficiary_id = '".(int) $beneficiary_id."' , product_id = '".(int) $product_id."'");
    }
    public function deletebeneficiaryproduct($product_id)
    {
        $this->db->query('DELETE FROM `'.DB_PREFIX."product_to_beneficiary` WHERE `product_id` = '".$product_id."'");
    }
    public function getTotalbeneficiarysBybadgeId($badge_id)
    {
        $query = $this->db->query('SELECT COUNT(*) AS total FROM '.DB_PREFIX."badge_to_beneficiary WHERE badge_id = '".$this->db->escape($badge_id)."'");

        return $query->row['total'];
    }
    public function getbeneficiaryGroups($data = array())
    {
        $sql = 'SELECT * FROM '.DB_PREFIX.'beneficiary_group cg LEFT JOIN '.DB_PREFIX."beneficiary_group_description cgd ON (cg.beneficiary_group_id = cgd.beneficiary_group_id) WHERE cgd.language_id = '".(int) $this->config->get('config_language_id')."'";

        $sort_data = array(
            'cgd.name',
            'cg.sort_order',
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
    public function getBeneficiarySubscription()
    {
        $sql = '
		SELECT *
		FROM '.DB_PREFIX.'customer c
		LEFT JOIN '.DB_PREFIX.'beneficiary_group cd ON (c.beneficiary_group_id = cd.beneficiary_group_id) 
		LEFT JOIN '.DB_PREFIX."beneficiary_group_description cgd ON (c.beneficiary_group_id = cgd.beneficiary_group_id)
		WHERE  c.beneficiary_approved = '1'
		";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function Beneficiaryaddimage($beneficiary_image, $beneficiary_id)
    {
        $this->db->query('UPDATE '.DB_PREFIX."customer SET image = '".$beneficiary_image."' WHERE customer_id='".(int) $beneficiary_id."'");
    }
    public function Beneficiarydeleteimage($beneficiary_id)
    {
        $this->db->query('UPDATE '.DB_PREFIX."customer SET image = '' WHERE customer_id='".(int) $beneficiary_id."'");
    }

    public function Beneficiaryfacebook($beneficiary_facebook, $beneficiary_id)
    {
        $this->db->query('UPDATE '.DB_PREFIX."customer SET facebook = '".$beneficiary_facebook."' WHERE customer_id='".(int) $beneficiary_id."'");
    }

    public function Beneficiarytwitter($beneficiary_twitter, $beneficiary_id)
    {
        $this->db->query('UPDATE '.DB_PREFIX."customer SET twitter = '".$beneficiary_twitter."' WHERE customer_id='".(int) $beneficiary_id."'");
    }

    public function Beneficiarygoogleplus($beneficiary_googleplus, $beneficiary_id)
    {
        $this->db->query('UPDATE '.DB_PREFIX."customer SET googleplus = '".$beneficiary_googleplus."' WHERE customer_id='".(int) $beneficiary_id."'");
    }

    public function Beneficiaryinstagram($beneficiary_instagram, $beneficiary_id)
    {
        $this->db->query('UPDATE '.DB_PREFIX."customer SET instagram = '".$beneficiary_instagram."' WHERE customer_id='".(int) $beneficiary_id."'");
    }

    public function getbeneficiaryCategories($beneficiary_id)
    {
        $product_category_data = array();

        $query = $this->db->query('SELECT * FROM '.DB_PREFIX."category_to_beneficiary WHERE beneficiary_id = '".(int) $beneficiary_id."'");

        foreach ($query->rows as $result) {
            $product_category_data[] = $result['category_id'];
        }

        return $product_category_data;
    }
}
