<?php

$this->load->model('user/user_group');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'badge/badge');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'bank/bank');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'commission/commission_rate');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'beneficiary/beneficiary');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'beneficiary/order');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'beneficiary/beneficiary_group');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'beneficiarydashboard/customer_online');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'beneficiarydashboard/beneficiary');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'beneficiarydashboard/beneficiary_online');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'beneficiarydashboard/beneficiary');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'beneficiarydashboard/order');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'beneficiarydashboard/beneficiary_group');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'access', 'beneficiaryreview/beneficiaryreview');

$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'badge/badge');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'bank/bank');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'commission/commission_rate');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'beneficiary/beneficiary');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'beneficiary/order');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'beneficiary/beneficiary_group');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'beneficiarydashboard/customer_online');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'beneficiarydashboard/beneficiary');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'beneficiarydashboard/beneficiary_online');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'beneficiarydashboard/beneficiary');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'beneficiarydashboard/order');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'beneficiarydashboard/beneficiary_group');
$this->model_user_user_group->addPermission($this->user->getGroupId(), 'modify', 'beneficiaryreview/beneficiaryreview');
