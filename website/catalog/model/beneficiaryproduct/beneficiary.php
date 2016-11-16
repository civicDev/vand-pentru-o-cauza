<?php

class Modelbeneficiaryproductbeneficiary extends Model
{
    public function getbeneficiarygroupIdBybeneficiaryId()
    {
        $query = $this->db->query('SELECT * FROM '.DB_PREFIX.'customer c 
		LEFT JOIN '.DB_PREFIX.'beneficiary_group sg ON (c.beneficiary_group_id = sg.beneficiary_group_id)
		LEFT JOIN '.DB_PREFIX."beneficiary_group_description sgd ON (c.beneficiary_group_id = sgd.beneficiary_group_id)
		 WHERE c.customer_id =  '".(int) $this->customer->getId()."' 
		 
		 AND sgd.language_id = '".(int) $this->config->get('config_language_id')."'");

        return $query->row;
    }
}
