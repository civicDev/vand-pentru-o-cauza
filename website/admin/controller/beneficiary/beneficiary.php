<?php

class Controllerbeneficiarybeneficiary extends Controller
{
    private $error = array();

    public function index()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('beneficiary/beneficiary');

        $this->getList();
    }

    public function add()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('beneficiary/beneficiary');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_beneficiary_beneficiary->addbeneficiary($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_email'])) {
                $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_beneficiary_group_id'])) {
                $url .= '&filter_beneficiary_group_id='.$this->request->get['filter_beneficiary_group_id'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status='.$this->request->get['filter_status'];
            }

            if (isset($this->request->get['filter_beneficiary_approved'])) {
                $url .= '&filter_beneficiary_approved='.$this->request->get['filter_beneficiary_approved'];
            }

            if (isset($this->request->get['filter_ip'])) {
                $url .= '&filter_ip='.$this->request->get['filter_ip'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            $this->response->redirect($this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url, 'SSL'));
        }

        $this->getAllCustomer();
    }

    public function edit()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('beneficiary/beneficiary');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_beneficiary_beneficiary->editbeneficiary($this->request->get['beneficiary_id'], $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_email'])) {
                $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_beneficiary_group_id'])) {
                $url .= '&filter_beneficiary_group_id='.$this->request->get['filter_beneficiary_group_id'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status='.$this->request->get['filter_status'];
            }

            if (isset($this->request->get['filter_beneficiary_approved'])) {
                $url .= '&filter_beneficiary_approved='.$this->request->get['filter_beneficiary_approved'];
            }

            if (isset($this->request->get['filter_ip'])) {
                $url .= '&filter_ip='.$this->request->get['filter_ip'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            $this->response->redirect($this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url, 'SSL'));
        }

        $this->getForm();
    }

    public function delete()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('beneficiary/beneficiary');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $beneficiary_id) {
                $this->model_beneficiary_beneficiary->deletebeneficiary($beneficiary_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_email'])) {
                $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_beneficiary_group_id'])) {
                $url .= '&filter_beneficiary_group_id='.$this->request->get['filter_beneficiary_group_id'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status='.$this->request->get['filter_status'];
            }

            if (isset($this->request->get['filter_beneficiary_approved'])) {
                $url .= '&filter_beneficiary_approved='.$this->request->get['filter_beneficiary_approved'];
            }

            if (isset($this->request->get['filter_ip'])) {
                $url .= '&filter_ip='.$this->request->get['filter_ip'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            $this->response->redirect($this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url, 'SSL'));
        }

        $this->getList();
    }

    public function addtobeneficiary()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('beneficiary/beneficiary');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $beneficiary_id) {
                $comment = $this->language->get('comment');
                $this->model_beneficiary_beneficiary->addHistory($beneficiary_id, $comment);
                $this->model_beneficiary_beneficiary->addtobeneficiary($this->request->post['beneficiary_group_id'], $beneficiary_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_email'])) {
                $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_beneficiary_group_id'])) {
                $url .= '&filter_beneficiary_group_id='.$this->request->get['filter_beneficiary_group_id'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status='.$this->request->get['filter_status'];
            }

            if (isset($this->request->get['filter_beneficiary_approved'])) {
                $url .= '&filter_beneficiary_approved='.$this->request->get['filter_beneficiary_approved'];
            }

            if (isset($this->request->get['filter_ip'])) {
                $url .= '&filter_ip='.$this->request->get['filter_ip'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            $this->response->redirect($this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url, 'SSL'));
        }

        $this->getList();
    }
    public function approve()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('beneficiary/beneficiary');

        $beneficiarys = array();

        if (isset($this->request->post['selected'])) {
            $beneficiarys = $this->request->post['selected'];
        } elseif (isset($this->request->get['beneficiary_id'])) {
            $beneficiarys[] = $this->request->get['beneficiary_id'];
        }

        if ($beneficiarys && $this->validateApprove()) {
            $approve_comment = $this->language->get('approve_comment');
            $this->model_beneficiary_beneficiary->addHistory($this->request->get['beneficiary_id'], $approve_comment);

            $beneficiary_group_info = $this->model_beneficiary_beneficiary->getbeneficiarygroupIdBybeneficiaryId($this->request->get['beneficiary_id']);

            $transaction_approve_comment = sprintf($this->language->get('transaction_approve_comment'), $beneficiary_group_info['name']);

            $this->model_beneficiary_beneficiary->addTransaction($this->request->get['beneficiary_id'], $transaction_approve_comment, $beneficiary_group_info['subscription_price'] * -1);
            $this->model_beneficiary_beneficiary->approve($this->request->get['beneficiary_id']);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_email'])) {
                $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_beneficiary_group_id'])) {
                $url .= '&filter_beneficiary_group_id='.$this->request->get['filter_beneficiary_group_id'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status='.$this->request->get['filter_status'];
            }

            if (isset($this->request->get['filter_beneficiary_approved'])) {
                $url .= '&filter_beneficiary_approved='.$this->request->get['filter_beneficiary_approved'];
            }

            if (isset($this->request->get['filter_ip'])) {
                $url .= '&filter_ip='.$this->request->get['filter_ip'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            $this->response->redirect($this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url, 'SSL'));
        }

        $this->getList();
    }

    public function upgrade_beneficiarygroup()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('beneficiary/beneficiary');

        $beneficiarys = array();

        if (isset($this->request->post['selected'])) {
            $beneficiarys = $this->request->post['selected'];
        } elseif (isset($this->request->get['beneficiary_id'])) {
            $beneficiarys[] = $this->request->get['beneficiary_id'];
        }

        if ($beneficiarys && $this->validateApprove()) {
            $this->model_beneficiary_beneficiary->upgrade_beneficiarygroup($this->request->get['beneficiary_id']);

            $beneficiary_group_info = $this->model_beneficiary_beneficiary->getbeneficiarygroupIdBybeneficiaryId($this->request->get['beneficiary_id']);

            $upgrade_beneficiarygroup_comment = sprintf($this->language->get('upgrade_beneficiarygroup_comment'), $beneficiary_group_info['name']);

            $this->model_beneficiary_beneficiary->addHistory($this->request->get['beneficiary_id'], $upgrade_beneficiarygroup_comment);

            $transaction_approve_comment = sprintf($this->language->get('transaction_approve_comment'), $beneficiary_group_info['name']);

            $this->model_beneficiary_beneficiary->addTransaction($this->request->get['beneficiary_id'], $transaction_approve_comment, $beneficiary_group_info['subscription_price'] * -1);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_email'])) {
                $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_beneficiary_group_id'])) {
                $url .= '&filter_beneficiary_group_id='.$this->request->get['filter_beneficiary_group_id'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status='.$this->request->get['filter_status'];
            }

            if (isset($this->request->get['filter_beneficiary_approved'])) {
                $url .= '&filter_beneficiary_approved='.$this->request->get['filter_beneficiary_approved'];
            }

            if (isset($this->request->get['filter_ip'])) {
                $url .= '&filter_ip='.$this->request->get['filter_ip'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            $this->response->redirect($this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url, 'SSL'));
        }

        $this->getList();
    }

    public function disapprove()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('beneficiary/beneficiary');

        $beneficiarys = array();

        if (isset($this->request->post['selected'])) {
            $beneficiarys = $this->request->post['selected'];
        } elseif (isset($this->request->get['beneficiary_id'])) {
            $beneficiarys[] = $this->request->get['beneficiary_id'];
        }

        if ($beneficiarys && $this->validatedisapprove()) {
            $disapprove_comment = $this->language->get('disapprove_comment');
            $this->model_beneficiary_beneficiary->addHistory($this->request->get['beneficiary_id'], $disapprove_comment);
            $this->model_beneficiary_beneficiary->disapprove($this->request->get['beneficiary_id']);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_email'])) {
                $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_beneficiary_group_id'])) {
                $url .= '&filter_beneficiary_group_id='.$this->request->get['filter_beneficiary_group_id'];
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status='.$this->request->get['filter_status'];
            }

            if (isset($this->request->get['filter_beneficiary_disapproved'])) {
                $url .= '&filter_beneficiary_disapproved='.$this->request->get['filter_beneficiary_disapproved'];
            }

            if (isset($this->request->get['filter_ip'])) {
                $url .= '&filter_ip='.$this->request->get['filter_ip'];
            }

            if (isset($this->request->get['filter_date_added'])) {
                $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page='.$this->request->get['page'];
            }

            $this->response->redirect($this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url, 'SSL'));
        }

        $this->getList();
    }

    protected function getList()
    {
        if (isset($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
        } else {
            $filter_name = null;
        }

        if (isset($this->request->get['filter_email'])) {
            $filter_email = $this->request->get['filter_email'];
        } else {
            $filter_email = null;
        }

        if (isset($this->request->get['filter_beneficiary_group_id'])) {
            $filter_beneficiary_group_id = $this->request->get['filter_beneficiary_group_id'];
        } else {
            $filter_beneficiary_group_id = null;
        }

        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }

        if (isset($this->request->get['filter_beneficiary_approved'])) {
            $filter_beneficiary_approved = $this->request->get['filter_beneficiary_approved'];
        } else {
            $filter_beneficiary_approved = null;
        }

        if (isset($this->request->get['filter_ip'])) {
            $filter_ip = $this->request->get['filter_ip'];
        } else {
            $filter_ip = null;
        }

        if (isset($this->request->get['filter_date_added'])) {
            $filter_date_added = $this->request->get['filter_date_added'];
        } else {
            $filter_date_added = null;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'name';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_beneficiary_group_id'])) {
            $url .= '&filter_beneficiary_group_id='.$this->request->get['filter_beneficiary_group_id'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status='.$this->request->get['filter_status'];
        }

        if (isset($this->request->get['filter_beneficiary_approved'])) {
            $url .= '&filter_beneficiary_approved='.$this->request->get['filter_beneficiary_approved'];
        }

        if (isset($this->request->get['filter_ip'])) {
            $url .= '&filter_ip='.$this->request->get['filter_ip'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort='.$this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order='.$this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page='.$this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token='.$this->session->data['token'], 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url, 'SSL'),
        );

        $data['insert'] = $this->url->link('beneficiary/beneficiary/add', 'token='.$this->session->data['token'].$url, 'SSL');
        $data['delete'] = $this->url->link('beneficiary/beneficiary/delete', 'token='.$this->session->data['token'].$url, 'SSL');

        $data['beneficiarys'] = array();

        $filter_data = array(
            'filter_name' => $filter_name,
            'filter_email' => $filter_email,
            'filter_beneficiary_group_id' => $filter_beneficiary_group_id,
            'filter_status' => $filter_status,
            'filter_beneficiary_approved' => $filter_beneficiary_approved,
            'filter_date_added' => $filter_date_added,
            'filter_ip' => $filter_ip,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin'),
        );

        $beneficiary_total = $this->model_beneficiary_beneficiary->getTotalbeneficiarys($filter_data);

        $results = $this->model_beneficiary_beneficiary->getbeneficiarys($filter_data);

        foreach ($results as $result) {
            $data['beneficiarys'][] = array(
                'beneficiary_id' => $result['customer_id'],
                'name' => $result['name'],
                'email' => $result['email'],
                'beneficiary_group' => $result['beneficiary_group'],
                'beneficiary_group_id' => $result['beneficiary_group_id'],
                'beneficiary_product' => $result['product_total'],
                'beneficiary_changegroup' => $this->model_beneficiary_beneficiary->getbeneficiarygroup($result['beneficiary_changegroup']),
                'beneficiary_changegroup_id' => $result['beneficiary_changegroup'],
                'status' => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
                'ip' => $result['ip'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['beneficiary_date_added'])),
                'edit' => $this->url->link('beneficiary/beneficiary/edit', 'token='.$this->session->data['token'].'&beneficiary_id='.$result['customer_id'].$url, 'SSL'),
                'approve' => $this->url->link('beneficiary/beneficiary/approve', 'token='.$this->session->data['token'].'&beneficiary_id='.$result['customer_id'].$url, 'SSL'),
                'upgrade_beneficiarygroup' => $this->url->link('beneficiary/beneficiary/upgrade_beneficiarygroup', 'token='.$this->session->data['token'].'&beneficiary_id='.$result['customer_id'].$url, 'SSL'),
                'beneficiary_approved' => $result['beneficiary_approved'],
                'disapprove' => $this->url->link('beneficiary/beneficiary/disapprove', 'token='.$this->session->data['token'].'&beneficiary_id='.$result['customer_id'].$url, 'SSL'),
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_default'] = $this->language->get('text_default');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');
        $data['text_login'] = $this->language->get('text_login');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_email'] = $this->language->get('column_email');
        $data['column_beneficiary_group'] = $this->language->get('column_beneficiary_group');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_beneficiary_approved'] = $this->language->get('column_beneficiary_approved');
        $data['column_ip'] = $this->language->get('column_ip');
        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_action'] = $this->language->get('column_action');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_beneficiary_group'] = $this->language->get('entry_beneficiary_group');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_beneficiary_approved'] = $this->language->get('entry_beneficiary_approved');
        $data['entry_ip'] = $this->language->get('entry_ip');
        $data['entry_date_added'] = $this->language->get('entry_date_added');

        $data['button_approve'] = $this->language->get('button_approve');
        $data['button_disapprove'] = $this->language->get('button_disapprove');
        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');
        $data['button_upgrade_beneficiarygroup'] = $this->language->get('button_upgrade_beneficiarygroup');

        $data['token'] = $this->session->data['token'];

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array) $this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_beneficiary_group_id'])) {
            $url .= '&filter_beneficiary_group_id='.$this->request->get['filter_beneficiary_group_id'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status='.$this->request->get['filter_status'];
        }

        if (isset($this->request->get['filter_beneficiary_approved'])) {
            $url .= '&filter_beneficiary_approved='.$this->request->get['filter_beneficiary_approved'];
        }

        if (isset($this->request->get['filter_ip'])) {
            $url .= '&filter_ip='.$this->request->get['filter_ip'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page='.$this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].'&sort=name'.$url, 'SSL');
        $data['sort_email'] = $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].'&sort=c.email'.$url, 'SSL');
        $data['sort_beneficiary_group'] = $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].'&sort=beneficiary_group'.$url, 'SSL');
        $data['sort_status'] = $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].'&sort=c.status'.$url, 'SSL');
        $data['sort_ip'] = $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].'&sort=c.ip'.$url, 'SSL');
        $data['sort_beneficiary_product'] = $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].'&sort=pts.beneficiary_id'.$url, 'SSL');
        $data['sort_date_added'] = $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].'&sort=c.date_added'.$url, 'SSL');

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_beneficiary_group_id'])) {
            $url .= '&filter_beneficiary_group_id='.$this->request->get['filter_beneficiary_group_id'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status='.$this->request->get['filter_status'];
        }

        if (isset($this->request->get['filter_beneficiary_approved'])) {
            $url .= '&filter_beneficiary_approved='.$this->request->get['filter_beneficiary_approved'];
        }

        if (isset($this->request->get['filter_ip'])) {
            $url .= '&filter_ip='.$this->request->get['filter_ip'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort='.$this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order='.$this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $beneficiary_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url.'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($beneficiary_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($beneficiary_total - $this->config->get('config_limit_admin'))) ? $beneficiary_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $beneficiary_total, ceil($beneficiary_total / $this->config->get('config_limit_admin')));

        $data['filter_name'] = $filter_name;
        $data['filter_email'] = $filter_email;
        $data['filter_beneficiary_group_id'] = $filter_beneficiary_group_id;
        $data['filter_status'] = $filter_status;
        $data['filter_beneficiary_approved'] = $filter_beneficiary_approved;
        $data['filter_ip'] = $filter_ip;
        $data['filter_date_added'] = $filter_date_added;

        $this->load->model('beneficiary/beneficiary_group');

        $data['beneficiary_groups'] = $this->model_beneficiary_beneficiary_group->getbeneficiaryGroups();

        $this->load->model('setting/store');

        $data['stores'] = $this->model_setting_store->getStores();

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('beneficiary/beneficiary_list.tpl', $data));
    }

    protected function getAllCustomer()
    {
        $this->load->model('customer/customer');

        $this->load->model('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary_group');

        $data['beneficiary_groups'] = $this->model_beneficiary_beneficiary_group->getbeneficiaryGroups();

        if (isset($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
        } else {
            $filter_name = null;
        }

        if (isset($this->request->get['filter_email'])) {
            $filter_email = $this->request->get['filter_email'];
        } else {
            $filter_email = null;
        }

        if (isset($this->request->get['filter_customer_group_id'])) {
            $filter_customer_group_id = $this->request->get['filter_customer_group_id'];
        } else {
            $filter_customer_group_id = null;
        }

        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }

        if (isset($this->request->get['filter_approved'])) {
            $filter_approved = $this->request->get['filter_approved'];
        } else {
            $filter_approved = null;
        }

        if (isset($this->request->get['filter_ip'])) {
            $filter_ip = $this->request->get['filter_ip'];
        } else {
            $filter_ip = null;
        }

        if (isset($this->request->get['filter_date_added'])) {
            $filter_date_added = $this->request->get['filter_date_added'];
        } else {
            $filter_date_added = null;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'name';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_customer_group_id'])) {
            $url .= '&filter_customer_group_id='.$this->request->get['filter_customer_group_id'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status='.$this->request->get['filter_status'];
        }

        if (isset($this->request->get['filter_approved'])) {
            $url .= '&filter_approved='.$this->request->get['filter_approved'];
        }

        if (isset($this->request->get['filter_ip'])) {
            $url .= '&filter_ip='.$this->request->get['filter_ip'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort='.$this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order='.$this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page='.$this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token='.$this->session->data['token'], 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url, 'SSL'),
        );

        $data['insert'] = $this->url->link('customer/customer/add', 'token='.$this->session->data['token'].$url, 'SSL');
        $data['addtobeneficiary'] = $this->url->link('beneficiary/beneficiary/addtobeneficiary', 'token='.$this->session->data['token'].$url, 'SSL');

        $data['customers'] = array();

        $filter_data = array(
            'filter_name' => $filter_name,
            'filter_email' => $filter_email,
            'filter_customer_group_id' => $filter_customer_group_id,
            'filter_status' => $filter_status,
            'filter_approved' => $filter_approved,
            'filter_date_added' => $filter_date_added,
            'filter_ip' => $filter_ip,
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin'),
        );

        $customer_total = $this->model_beneficiary_beneficiary->getTotalCustomers($filter_data);

        $results = $this->model_beneficiary_beneficiary->getCustomers($filter_data);
        foreach ($results as $result) {
            $data['customers'][] = array(
                'customer_id' => $result['customer_id'],
                'name' => $result['name'],
                'email' => $result['email'],
                'customer_group' => $this->model_beneficiary_beneficiary->getbeneficiarygroupIdRequsetBybeneficiaryId($result['customer_id']),
                'status' => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
                'ip' => $result['ip'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                'edit' => $this->url->link('customer/customer/edit', 'token='.$this->session->data['token'].'&customer_id='.$result['customer_id'].$url, 'SSL'),
                'approve' => $this->url->link('beneficiary/beneficiary/addnewbeneficiary', 'token='.$this->session->data['token'].'&beneficiary_id='.$result['customer_id'].$url, 'SSL'),
                'approved' => $result['approved'],
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_default'] = $this->language->get('text_default');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');
        $data['text_login'] = $this->language->get('text_login');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_email'] = $this->language->get('column_email');
        $data['column_beneficiary_group'] = $this->language->get('column_beneficiary_group');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_approved'] = $this->language->get('column_approved');
        $data['column_ip'] = $this->language->get('column_ip');
        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_action'] = $this->language->get('column_action');

        $data['entry_beneficiary_group'] = $this->language->get('entry_beneficiary_group');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_beneficiary_group'] = $this->language->get('entry_beneficiary_group');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_beneficiary_approved'] = $this->language->get('entry_beneficiary_approved');
        $data['entry_ip'] = $this->language->get('entry_ip');
        $data['entry_date_added'] = $this->language->get('entry_date_added');

        $data['button_approve'] = $this->language->get('button_approve');
        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');
        $data['button_addtobeneficiary'] = $this->language->get('button_addtobeneficiary');

        $data['token'] = $this->session->data['token'];

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array) $this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_customer_group_id'])) {
            $url .= '&filter_customer_group_id='.$this->request->get['filter_customer_group_id'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status='.$this->request->get['filter_status'];
        }

        if (isset($this->request->get['filter_approved'])) {
            $url .= '&filter_approved='.$this->request->get['filter_approved'];
        }

        if (isset($this->request->get['filter_ip'])) {
            $url .= '&filter_ip='.$this->request->get['filter_ip'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page='.$this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('beneficiary/beneficiary/add', 'token='.$this->session->data['token'].'&sort=name'.$url, 'SSL');
        $data['sort_email'] = $this->url->link('beneficiary/beneficiary/add', 'token='.$this->session->data['token'].'&sort=c.email'.$url, 'SSL');
        $data['sort_customer_group'] = $this->url->link('beneficiary/beneficiary/add', 'token='.$this->session->data['token'].'&sort=customer_group'.$url, 'SSL');
        $data['sort_status'] = $this->url->link('beneficiary/beneficiary/add', 'token='.$this->session->data['token'].'&sort=c.status'.$url, 'SSL');
        $data['sort_ip'] = $this->url->link('beneficiary/beneficiary/add', 'token='.$this->session->data['token'].'&sort=c.ip'.$url, 'SSL');
        $data['sort_date_added'] = $this->url->link('beneficiary/beneficiary/add', 'token='.$this->session->data['token'].'&sort=c.date_added'.$url, 'SSL');

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_customer_group_id'])) {
            $url .= '&filter_customer_group_id='.$this->request->get['filter_customer_group_id'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status='.$this->request->get['filter_status'];
        }

        if (isset($this->request->get['filter_approved'])) {
            $url .= '&filter_approved='.$this->request->get['filter_approved'];
        }

        if (isset($this->request->get['filter_ip'])) {
            $url .= '&filter_ip='.$this->request->get['filter_ip'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort='.$this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order='.$this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $customer_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('beneficiary/beneficiary/add', 'token='.$this->session->data['token'].$url.'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($customer_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($customer_total - $this->config->get('config_limit_admin'))) ? $customer_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $customer_total, ceil($customer_total / $this->config->get('config_limit_admin')));

        $data['filter_name'] = $filter_name;
        $data['filter_email'] = $filter_email;
        $data['filter_customer_group_id'] = $filter_customer_group_id;
        $data['filter_status'] = $filter_status;
        $data['filter_approved'] = $filter_approved;
        $data['filter_ip'] = $filter_ip;
        $data['filter_date_added'] = $filter_date_added;

        //$this->load->model('customer/customer_group');

        $data['customer_groups'] = $this->model_beneficiary_beneficiary->getbeneficiaryGroups();

        $this->load->model('setting/store');

        $data['stores'] = $this->model_setting_store->getStores();

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('beneficiary/allcustomer_list.tpl', $data));
    }

    protected function getForm()
    {
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_form'] = !isset($this->request->get['beneficiary_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_loading'] = $this->language->get('text_loading');
        $data['text_add_ban_ip'] = $this->language->get('text_add_ban_ip');
        $data['text_remove_ban_ip'] = $this->language->get('text_remove_ban_ip');
        $data['text_confirm'] = $this->language->get('text_confirm');
        $data['entry_product'] = $this->language->get('entry_product');
        $data['entry_beneficiary_avatar'] = $this->language->get('entry_beneficiary_avatar');
        $data['entry_beneficiary_group'] = $this->language->get('entry_beneficiary_group');
        $data['entry_firstname'] = $this->language->get('entry_firstname');
        $data['entry_lastname'] = $this->language->get('entry_lastname');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_telephone'] = $this->language->get('entry_telephone');
        $data['entry_fax'] = $this->language->get('entry_fax');
        $data['entry_password'] = $this->language->get('entry_password');
        $data['entry_confirm'] = $this->language->get('entry_confirm');
        $data['entry_newsletter'] = $this->language->get('entry_newsletter');
        $data['entry_safe'] = $this->language->get('entry_safe');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_company_id'] = $this->language->get('entry_company_id');
        $data['entry_branch_id'] = $this->language->get('entry_branch_id');
        $data['entry_bank'] = $this->language->get('entry_bank');
        $data['entry_bankaccount_1'] = $this->language->get('entry_bankaccount_1');
        $data['entry_bankaccount_2'] = $this->language->get('entry_bankaccount_2');
        $data['entry_city'] = $this->language->get('entry_city');
        $data['entry_postcode'] = $this->language->get('entry_postcode');
        $data['entry_zone'] = $this->language->get('entry_zone');
        $data['entry_country'] = $this->language->get('entry_country');
        $data['entry_default'] = $this->language->get('entry_default');
        $data['entry_comment'] = $this->language->get('entry_comment');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_amount'] = $this->language->get('entry_amount');
        $data['entry_points'] = $this->language->get('entry_points');
        $data['button_approve'] = $this->language->get('button_approve');
        $data['button_disapprove'] = $this->language->get('button_disapprove');

        $data['help_safe'] = $this->language->get('help_safe');
        $data['help_points'] = $this->language->get('help_points');

        $data['entry_facebook'] = $this->language->get('entry_facebook');
        $data['entry_twitter'] = $this->language->get('entry_twitter');
        $data['entry_googleplus'] = $this->language->get('entry_googleplus');
        $data['entry_instagram'] = $this->language->get('entry_instagram');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_bankaccount_add'] = $this->language->get('button_bankaccount_add');
        $data['button_product_add'] = $this->language->get('button_product_add');
        $data['button_product_delete'] = $this->language->get('button_product_delete');
        $data['button_history_add'] = $this->language->get('button_history_add');
        $data['button_transaction_add'] = $this->language->get('button_transaction_add');
        $data['button_reward_add'] = $this->language->get('button_reward_add');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_upload'] = $this->language->get('button_upload');

        $data['tab_general'] = $this->language->get('tab_general');
        $data['tab_bankaccount'] = $this->language->get('tab_bankaccount');
        $data['tab_history'] = $this->language->get('tab_history');
        $data['tab_badge'] = $this->language->get('tab_badge');
        $data['tab_beneficiaryproduct'] = $this->language->get('tab_beneficiaryproduct');
        $data['tab_transaction'] = $this->language->get('tab_transaction');
        $data['tab_reward'] = $this->language->get('tab_reward');
        $data['tab_ip'] = $this->language->get('tab_ip');
        $data['help_category'] = $this->language->get('help_category');
        $data['entry_category'] = $this->language->get('entry_category');
        $data['tab_categories'] = $this->language->get('tab_categories');
        $data['tab_more_details'] = $this->language->get('tab_more_details');

        $data['token'] = $this->session->data['token'];

        $this->load->model('bank/bank');
        $data['banks'] = $this->model_bank_bank->getbankes();

        if (isset($this->request->get['beneficiary_id'])) {
            $data['beneficiary_id'] = $this->request->get['beneficiary_id'];
        } else {
            $data['beneficiary_id'] = 0;
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['firstname'])) {
            $data['error_firstname'] = $this->error['firstname'];
        } else {
            $data['error_firstname'] = '';
        }

        if (isset($this->error['lastname'])) {
            $data['error_lastname'] = $this->error['lastname'];
        } else {
            $data['error_lastname'] = '';
        }

        if (isset($this->error['email'])) {
            $data['error_email'] = $this->error['email'];
        } else {
            $data['error_email'] = '';
        }

        if (isset($this->error['telephone'])) {
            $data['error_telephone'] = $this->error['telephone'];
        } else {
            $data['error_telephone'] = '';
        }

        if (isset($this->error['password'])) {
            $data['error_password'] = $this->error['password'];
        } else {
            $data['error_password'] = '';
        }

        if (isset($this->error['confirm'])) {
            $data['error_confirm'] = $this->error['confirm'];
        } else {
            $data['error_confirm'] = '';
        }

        if (isset($this->error['bankaccount'])) {
            $data['error_bankaccount'] = $this->error['bankaccount'];
        } else {
            $data['error_bankaccount'] = '';
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name='.urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_email'])) {
            $url .= '&filter_email='.urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_beneficiary_group_id'])) {
            $url .= '&filter_beneficiary_group_id='.$this->request->get['filter_beneficiary_group_id'];
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status='.$this->request->get['filter_status'];
        }

        if (isset($this->request->get['filter_beneficiary_approved'])) {
            $url .= '&filter_beneficiary_approved='.$this->request->get['filter_beneficiary_approved'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added='.$this->request->get['filter_date_added'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort='.$this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order='.$this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page='.$this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token='.$this->session->data['token'], 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url, 'SSL'),
        );

        if (!isset($this->request->get['beneficiary_id'])) {
            $data['action'] = $this->url->link('beneficiary/beneficiary/add', 'token='.$this->session->data['token'].$url, 'SSL');
        } else {
            $data['action'] = $this->url->link('beneficiary/beneficiary/edit', 'token='.$this->session->data['token'].'&beneficiary_id='.$this->request->get['beneficiary_id'].$url, 'SSL');
        }

        $data['cancel'] = $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'].$url, 'SSL');

        if (isset($this->request->get['beneficiary_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $beneficiary_info = $this->model_beneficiary_beneficiary->getbeneficiary($this->request->get['beneficiary_id']);
        }

        $this->load->model('beneficiary/beneficiary_group');

        $data['beneficiary_groups'] = $this->model_beneficiary_beneficiary_group->getbeneficiaryGroups();

        if (isset($this->request->post['beneficiary_group_id'])) {
            $data['beneficiary_group_id'] = $this->request->post['beneficiary_group_id'];
        } elseif (!empty($beneficiary_info)) {
            $data['beneficiary_group_id'] = $beneficiary_info['beneficiary_group_id'];
        } else {
            $data['beneficiary_group_id'] = $this->config->get('config_beneficiary_group_id');
        }

        if (isset($this->request->post['firstname'])) {
            $data['firstname'] = $this->request->post['firstname'];
        } elseif (!empty($beneficiary_info)) {
            $data['firstname'] = $beneficiary_info['firstname'];
        } else {
            $data['firstname'] = '';
        }

        if (isset($this->request->post['lastname'])) {
            $data['lastname'] = $this->request->post['lastname'];
        } elseif (!empty($beneficiary_info)) {
            $data['lastname'] = $beneficiary_info['lastname'];
        } else {
            $data['lastname'] = '';
        }

        if (isset($this->request->post['email'])) {
            $data['email'] = $this->request->post['email'];
        } elseif (!empty($beneficiary_info)) {
            $data['email'] = $beneficiary_info['email'];
        } else {
            $data['email'] = '';
        }

        if (isset($this->request->post['telephone'])) {
            $data['telephone'] = $this->request->post['telephone'];
        } elseif (!empty($beneficiary_info)) {
            $data['telephone'] = $beneficiary_info['telephone'];
        } else {
            $data['telephone'] = '';
        }

        if (isset($this->request->post['fax'])) {
            $data['fax'] = $this->request->post['fax'];
        } elseif (!empty($beneficiary_info)) {
            $data['fax'] = $beneficiary_info['fax'];
        } else {
            $data['fax'] = '';
        }

        if (isset($this->request->post['facebook'])) {
            $data['facebook'] = $this->request->post['facebook'];
        } elseif (!empty($beneficiary_info)) {
            $data['facebook'] = $beneficiary_info['facebook'];
        } else {
            $data['facebook'] = '';
        }

        if (isset($this->request->post['twitter'])) {
            $data['twitter'] = $this->request->post['twitter'];
        } elseif (!empty($beneficiary_info)) {
            $data['twitter'] = $beneficiary_info['twitter'];
        } else {
            $data['twitter'] = '';
        }

        if (isset($this->request->post['googleplus'])) {
            $data['googleplus'] = $this->request->post['googleplus'];
        } elseif (!empty($beneficiary_info)) {
            $data['googleplus'] = $beneficiary_info['googleplus'];
        } else {
            $data['googleplus'] = '';
        }

        if (isset($this->request->post['instagram'])) {
            $data['instagram'] = $this->request->post['instagram'];
        } elseif (!empty($beneficiary_info)) {
            $data['instagram'] = $beneficiary_info['instagram'];
        } else {
            $data['instagram'] = '';
        }

        $data['beneficiary_approved'] = $beneficiary_info['beneficiary_approved'];
        $data['approve'] = $this->url->link('beneficiary/beneficiary/approve', 'token='.$this->session->data['token'].'&beneficiary_id='.$this->request->get['beneficiary_id'].$url, 'SSL');
        $data['upgrade_beneficiarygroup'] = $this->url->link('beneficiary/beneficiary/upgrade_beneficiarygroup', 'token='.$this->session->data['token'].'&beneficiary_id='.$this->request->get['beneficiary_id'].$url, 'SSL');
        $data['disapprove'] = $this->url->link('beneficiary/beneficiary/disapprove', 'token='.$this->session->data['token'].'&beneficiary_id='.$this->request->get['beneficiary_id'].$url, 'SSL');

        // Custom Fields
        $this->load->model('customer/custom_field');

        $data['custom_fields'] = array();

        $custom_fields = $this->model_customer_custom_field->getCustomFields();

        foreach ($custom_fields as $custom_field) {
            $data['custom_fields'][] = array(
                'custom_field_id' => $custom_field['custom_field_id'],
                'custom_field_value' => $this->model_customer_custom_field->getCustomFieldValues($custom_field['custom_field_id']),
                'name' => $custom_field['name'],
                'value' => $custom_field['value'],
                'type' => $custom_field['type'],
                'location' => $custom_field['location'],
            );
        }

        if (isset($this->request->post['custom_field'])) {
            $data['account_custom_field'] = $this->request->post['custom_field'];
        } elseif (!empty($beneficiary_info)) {
            $data['account_custom_field'] = json_decode($beneficiary_info['custom_field']);
        } else {
            $data['account_custom_field'] = array();
        }

        if (isset($this->request->post['newsletter'])) {
            $data['newsletter'] = $this->request->post['newsletter'];
        } elseif (!empty($beneficiary_info)) {
            $data['newsletter'] = $beneficiary_info['newsletter'];
        } else {
            $data['newsletter'] = '';
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($beneficiary_info)) {
            $data['status'] = $beneficiary_info['status'];
        } else {
            $data['status'] = 1;
        }

        if (isset($this->request->post['safe'])) {
            $data['safe'] = $this->request->post['safe'];
        } elseif (!empty($beneficiary_info)) {
            $data['safe'] = $beneficiary_info['safe'];
        } else {
            $data['safe'] = 0;
        }

        if (isset($this->request->post['password'])) {
            $data['password'] = $this->request->post['password'];
        } else {
            $data['password'] = '';
        }

        if (isset($this->request->post['confirm'])) {
            $data['confirm'] = $this->request->post['confirm'];
        } else {
            $data['confirm'] = '';
        }

        $this->load->model('localisation/country');

        $data['countries'] = $this->model_localisation_country->getCountries();

        if (isset($this->request->post['bankaccount'])) {
            $data['bankaccounts'] = $this->request->post['bankaccount'];
        } elseif (isset($this->request->get['beneficiary_id'])) {
            $data['bankaccounts'] = $this->model_beneficiary_beneficiary->getbankaccounts($this->request->get['beneficiary_id']);
        } else {
            $data['bankaccounts'] = array();
        }

        if (isset($this->request->post['bankaccount_id'])) {
            $data['bankaccount_id'] = $this->request->post['bankaccount_id'];
        } elseif (!empty($beneficiary_info)) {
            $data['bankaccount_id'] = $beneficiary_info['bankaccount_id'];
        } else {
            $data['bankaccount_id'] = '';
        }
        $this->load->model('tool/image');

        if (isset($this->request->post['image'])) {
            $data['image'] = $this->request->post['image'];
        } elseif (!empty($beneficiary_info)) {
            $data['image'] = $beneficiary_info['image'];
        } else {
            $data['image'] = '';
        }
        if (isset($this->request->post['image']) && is_file(DIR_IMAGE.$this->request->post['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
        } elseif (!empty($beneficiary_info) && is_file(DIR_IMAGE.$beneficiary_info['image'])) {
            $data['thumb'] = $this->model_tool_image->resize($beneficiary_info['image'], 100, 100);
        } else {
            $data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

            // Categories
        $this->load->model('beneficiary/beneficiary');
        $this->load->model('catalog/category');

        if (isset($this->request->post['beneficiary_category'])) {
            $categories = $this->request->post['beneficiary_category'];
        } elseif (isset($this->request->get['beneficiary_id'])) {
            $categories = $this->model_beneficiary_beneficiary->getbeneficiaryCategories($this->request->get['beneficiary_id']);
        } else {
            $categories = array();
        }

        $data['beneficiary_categories'] = array();

        foreach ($categories as $category_id) {
            $category_info = $this->model_catalog_category->getCategory($category_id);

            if ($category_info) {
                $data['beneficiary_categories'][] = array(
                    'category_id' => $category_info['category_id'],
                    'name' => ($category_info['path']) ? $category_info['path'].' &gt; '.$category_info['name'] : $category_info['name'],
                );
            }
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('beneficiary/beneficiary_form.tpl', $data));
    }

    protected function validateForm()
    {
        if (!$this->user->hasPermission('modify', 'beneficiary/beneficiary')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
            $this->error['firstname'] = $this->language->get('error_firstname');
        }

        if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
            $this->error['lastname'] = $this->language->get('error_lastname');
        }

        if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
            $this->error['email'] = $this->language->get('error_email');
        }

        $beneficiary_info = $this->model_beneficiary_beneficiary->getbeneficiaryByEmail($this->request->post['email']);

        if (!isset($this->request->get['beneficiary_id'])) {
            if ($beneficiary_info) {
                $this->error['warning'] = $this->language->get('error_exists');
            }
        } else {
            if ($beneficiary_info && ($this->request->get['beneficiary_id'] != $beneficiary_info['customer_id'])) {
                $this->error['warning'] = $this->language->get('error_exists');
            }
        }

        if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
            $this->error['telephone'] = $this->language->get('error_telephone');
        }

        // Custom field validation
        $this->load->model('customer/custom_field');

        $custom_fields = $this->model_customer_custom_field->getCustomFields(array('filter_beneficiary_group_id' => $this->request->post['beneficiary_group_id']));

        foreach ($custom_fields as $custom_field) {
            if (($custom_field['location'] == 'account') && $custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['custom_field_id']])) {
                $this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
            }
        }

        if ($this->request->post['password'] || (!isset($this->request->get['beneficiary_id']))) {
            if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
                $this->error['password'] = $this->language->get('error_password');
            }

            if ($this->request->post['password'] != $this->request->post['confirm']) {
                $this->error['confirm'] = $this->language->get('error_confirm');
            }
        }

        if (isset($this->request->post['bankaccount'])) {
            foreach ($this->request->post['bankaccount'] as $key => $value) {
                if ((utf8_strlen($value['firstname']) < 1) || (utf8_strlen($value['firstname']) > 32)) {
                    $this->error['bankaccount'][$key]['firstname'] = $this->language->get('error_firstname');
                }

                if ((utf8_strlen($value['lastname']) < 1) || (utf8_strlen($value['lastname']) > 32)) {
                    $this->error['bankaccount'][$key]['lastname'] = $this->language->get('error_lastname');
                }

                if ((utf8_strlen($value['bankaccount_1']) < 3) || (utf8_strlen($value['bankaccount_1']) > 128)) {
                    $this->error['bankaccount'][$key]['bankaccount_1'] = $this->language->get('error_bankaccount_1');
                }

                foreach ($custom_fields as $custom_field) {
                    if (($custom_field['location'] == 'bankaccount') && $custom_field['required'] && empty($value['custom_field'][$custom_field['custom_field_id']])) {
                        $this->error['bankaccount'][$key]['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
                    }
                }
            }
        }

        if ($this->error && !isset($this->error['warning'])) {
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }

    protected function validateDelete()
    {
        if (!$this->user->hasPermission('modify', 'beneficiary/beneficiary')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
    protected function validatebeneficiaryproduct()
    {
        if (!$this->user->hasPermission('modify', 'beneficiary/beneficiary')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    protected function validateApprove()
    {
        if (!$this->user->hasPermission('modify', 'beneficiary/beneficiary')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    protected function validateDisApprove()
    {
        if (!$this->user->hasPermission('modify', 'beneficiary/beneficiary')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }

    protected function validateHistory()
    {
        if (!$this->user->hasPermission('modify', 'beneficiary/beneficiary')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!isset($this->request->post['comment']) || utf8_strlen($this->request->post['comment']) < 1) {
            $this->error['warning'] = $this->language->get('error_comment');
        }

        return !$this->error;
    }

    public function login()
    {
        $json = array();

        if (isset($this->request->get['beneficiary_id'])) {
            $beneficiary_id = $this->request->get['beneficiary_id'];
        } else {
            $beneficiary_id = 0;
        }

        $this->load->model('beneficiary/beneficiary');

        $beneficiary_info = $this->model_beneficiary_beneficiary->getbeneficiary($beneficiary_id);

        if ($beneficiary_info) {
            $token = md5(mt_rand());

            $this->model_beneficiary_beneficiary->editToken($beneficiary_id, $token);

            if (isset($this->request->get['store_id'])) {
                $store_id = $this->request->get['store_id'];
            } else {
                $store_id = 0;
            }

            $this->load->model('setting/store');

            $store_info = $this->model_setting_store->getStore($store_id);

            if ($store_info) {
                $this->response->redirect($store_info['url'].'index.php?route=account/login&token='.$token);
            } else {
                $this->response->redirect(HTTP_CATALOG.'index.php?route=account/login&token='.$token);
            }
        } else {
            $this->load->language('error/not_found');

            $this->document->setTitle($this->language->get('heading_title'));

            $data['heading_title'] = $this->language->get('heading_title');

            $data['text_not_found'] = $this->language->get('text_not_found');

            $data['breadcrumbs'] = array();

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/dashboard', 'token='.$this->session->data['token'], 'SSL'),
            );

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('error/not_found', 'token='.$this->session->data['token'], 'SSL'),
            );

            $data['header'] = $this->load->controller('common/header');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['footer'] = $this->load->controller('common/footer');

            $this->response->setOutput($this->load->view('error/not_found.tpl', $data));
        }
    }

    public function badge()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatebadge()) {
            $this->model_beneficiary_beneficiary->addbadge($this->request->get['beneficiary_id'], $this->request->post['comment']);

            $data['success'] = $this->language->get('text_success');
        } else {
            $data['success'] = '';
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_badge'] = $this->language->get('entry_badge');
        $data['text_no_results'] = $this->language->get('text_no_results');

        if (isset($this->request->post['beneficiary_badge'])) {
            $data['beneficiary_badge'] = $this->request->post['beneficiary_badge'];
        } elseif (isset($this->request->get['beneficiary_id'])) {
            $data['beneficiary_badge'] = $this->model_beneficiary_beneficiary->getbadgebeneficiary($this->request->get['beneficiary_id']);
        } else {
            $data['beneficiary_badge'] = array($this->config->get('config_badge_id'));
        }

        $data['badges'] = array();

        $results = $this->model_beneficiary_beneficiary->getbadges();

        $this->load->model('tool/image');

        foreach ($results as $result) {
            $data['badges'][] = array(
            'badge_id' => $result['badge_id'],
                'title' => $result['title'],
                'image' => (is_file(DIR_IMAGE.$result['image']) ? $this->model_tool_image->resize($result['image'], 40, 40) : $this->model_tool_image->resize('no_image.png', 40, 40)),
            );
        }

        $this->response->setOutput($this->load->view('beneficiary/beneficiary_badge.tpl', $data));
    }
    public function beneficiaryproduct()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');

        if (!empty($this->request->post['product_id']) && $this->validatebeneficiaryproduct()) {
            {

            $this->model_beneficiary_beneficiary->addbeneficiaryproduct($this->request->post['beneficiary_id'], $this->request->post['product_id']);
}
            $data['success'] = $this->language->get('text_success');
        } else {
            $data['success'] = '';
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_beneficiaryproduct'] = $this->language->get('entry_beneficiaryproduct');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit'] = $this->language->get('button_edit');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_price'] = $this->language->get('column_price');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_action'] = $this->language->get('column_action');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->post['beneficiary_beneficiaryproduct'])) {
            $data['beneficiary_beneficiaryproduct'] = $this->request->post['beneficiary_beneficiaryproduct'];
        } elseif (isset($this->request->get['beneficiary_id'])) {
            $data['beneficiary_beneficiaryproduct'] = $this->model_beneficiary_beneficiary->getbeneficiaryproducts($this->request->get['beneficiary_id']);
        } else {
            $data['beneficiary_beneficiaryproduct'] = array($this->config->get('config_beneficiaryproduct_id'));
        }

        $data['beneficiaryproducts'] = array();

        $data['products'] = array();

        $this->load->model('tool/image');
        $this->load->model('catalog/product');
        //$product_total = $this->model_catalog_product->getTotalProducts();

        $results = $this->model_beneficiary_beneficiary->getProducts($this->request->get['beneficiary_id'], ($page - 1) * 10, 10);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 40, 40);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 40, 40);
            }

            $special = false;

            $product_specials = $this->model_catalog_product->getProductSpecials($result['product_id']);

            foreach ($product_specials  as $product_special) {
                if (($product_special['date_start'] == '0000-00-00' || strtotime($product_special['date_start']) < time()) && ($product_special['date_end'] == '0000-00-00' || strtotime($product_special['date_end']) > time())) {
                    $special = $product_special['price'];

                    break;
                }
            }

            $data['products'][] = array(
                'product_id' => $result['product_id'],
                'image' => $image,
                'name' => $result['name'],
                'model' => $result['model'],
                'price' => $result['price'],
                'special' => $special,
                'quantity' => $result['quantity'],
                'status' => ($result['status']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
                'edit' => $this->url->link('catalog/product/edit', 'token='.$this->session->data['token'].'&product_id='.$result['product_id'], 'SSL'),
            );
        }

        $product_total = $this->model_beneficiary_beneficiary->getTotalProducts($this->request->get['beneficiary_id']);
        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('beneficiary/beneficiary/beneficiaryproduct', 'token='.$this->session->data['token'].'&beneficiary_id='.$this->request->get['beneficiary_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($product_total - 10)) ? $product_total : ((($page - 1) * 10) + 10), $product_total, ceil($product_total / 10));

        $this->response->setOutput($this->load->view('beneficiary/beneficiary_beneficiaryproduct.tpl', $data));
    }

    public function beneficiaryproductdelete()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatebeneficiaryproduct()) {
            if (isset($this->request->post['selected']) && $this->validatebeneficiaryproduct()) {
                foreach ($this->request->post['selected'] as $product_id) {
                    $this->model_beneficiary_beneficiary->deletebeneficiaryproduct($product_id);
                }
            }
            $data['success'] = $this->language->get('text_success');
        } else {
            $data['success'] = '';
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_beneficiaryproduct'] = $this->language->get('entry_beneficiaryproduct');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit'] = $this->language->get('button_edit');
        $data['column_image'] = $this->language->get('column_image');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_price'] = $this->language->get('column_price');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_action'] = $this->language->get('column_action');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        if (isset($this->request->post['beneficiary_beneficiaryproduct'])) {
            $data['beneficiary_beneficiaryproduct'] = $this->request->post['beneficiary_beneficiaryproduct'];
        } elseif (isset($this->request->get['beneficiary_id'])) {
            $data['beneficiary_beneficiaryproduct'] = $this->model_beneficiary_beneficiary->getbeneficiaryproducts($this->request->get['beneficiary_id']);
        } else {
            $data['beneficiary_beneficiaryproduct'] = array($this->config->get('config_beneficiaryproduct_id'));
        }

        $data['beneficiaryproducts'] = array();

        $data['products'] = array();

        $this->load->model('tool/image');
        $this->load->model('catalog/product');
        //$product_total = $this->model_catalog_product->getTotalProducts();

        $results = $this->model_beneficiary_beneficiary->getProducts($this->request->get['beneficiary_id']);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 40, 40);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 40, 40);
            }

            $special = false;

            $product_specials = $this->model_catalog_product->getProductSpecials($result['product_id']);

            foreach ($product_specials  as $product_special) {
                if (($product_special['date_start'] == '0000-00-00' || strtotime($product_special['date_start']) < time()) && ($product_special['date_end'] == '0000-00-00' || strtotime($product_special['date_end']) > time())) {
                    $special = $product_special['price'];

                    break;
                }
            }

            $data['products'][] = array(
                'product_id' => $result['product_id'],
                'image' => $image,
                'name' => $result['name'],
                'model' => $result['model'],
                'price' => $result['price'],
                'special' => $special,
                'quantity' => $result['quantity'],
                'status' => ($result['status']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
                'edit' => $this->url->link('catalog/product/edit', 'token='.$this->session->data['token'].'&product_id='.$result['product_id'], 'SSL'),
            );
        }

        $product_total = $this->model_beneficiary_beneficiary->getTotalProducts();

        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('beneficiary/beneficiary/beneficiaryproduct', 'token='.$this->session->data['token'].'&beneficiary_id='.$this->request->get['beneficiary_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($product_total - 10)) ? $product_total : ((($page - 1) * 10) + 10), $product_total, ceil($product_total / 10));

        $this->response->setOutput($this->load->view('beneficiary/beneficiary_beneficiaryproduct.tpl', $data));
    }

    public function history()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateHistory()) {
            $this->model_beneficiary_beneficiary->addHistory($this->request->get['beneficiary_id'], $this->request->post['comment']);

            $data['success'] = $this->language->get('text_success');
        } else {
            $data['success'] = '';
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_comment'] = $this->language->get('column_comment');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['histories'] = array();

        $results = $this->model_beneficiary_beneficiary->getHistories($this->request->get['beneficiary_id'], ($page - 1) * 10, 10);

        foreach ($results as $result) {
            $data['histories'][] = array(
                'comment' => $result['comment'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
            );
        }

        $history_total = $this->model_beneficiary_beneficiary->getTotalHistories($this->request->get['beneficiary_id']);

        $pagination = new Pagination();
        $pagination->total = $history_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('beneficiary/beneficiary/history', 'token='.$this->session->data['token'].'&beneficiary_id='.$this->request->get['beneficiary_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($history_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($history_total - 10)) ? $history_total : ((($page - 1) * 10) + 10), $history_total, ceil($history_total / 10));

        $this->response->setOutput($this->load->view('beneficiary/beneficiary_history.tpl', $data));
    }

    public function transaction()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->hasPermission('modify', 'beneficiary/beneficiary')) {
            $this->model_beneficiary_beneficiary->addTransaction($this->request->get['beneficiary_id'], $this->request->post['description'], $this->request->post['amount']);

            $data['success'] = $this->language->get('text_success');
        } else {
            $data['success'] = '';
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$this->user->hasPermission('modify', 'beneficiary/beneficiary')) {
            $data['error_warning'] = $this->language->get('error_permission');
        } else {
            $data['error_warning'] = '';
        }

        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_balance'] = $this->language->get('text_balance');

        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_description'] = $this->language->get('column_description');
        $data['column_amount'] = $this->language->get('column_amount');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['transactions'] = array();

        $results = $this->model_beneficiary_beneficiary->getTransactions($this->request->get['beneficiary_id'], ($page - 1) * 10, 10);

        foreach ($results as $result) {
            $data['transactions'][] = array(
                'amount' => $this->currency->format($result['amount'], $this->config->get('config_currency')),
                'description' => $result['description'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
            );
        }

        $data['balance'] = $this->currency->format($this->model_beneficiary_beneficiary->getTransactionTotal($this->request->get['beneficiary_id']), $this->config->get('config_currency'));

        $transaction_total = $this->model_beneficiary_beneficiary->getTotalTransactions($this->request->get['beneficiary_id']);

        $pagination = new Pagination();
        $pagination->total = $transaction_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('beneficiary/beneficiary/transaction', 'token='.$this->session->data['token'].'&beneficiary_id='.$this->request->get['beneficiary_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($transaction_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($transaction_total - 10)) ? $transaction_total : ((($page - 1) * 10) + 10), $transaction_total, ceil($transaction_total / 10));

        $this->response->setOutput($this->load->view('beneficiary/beneficiary_transaction.tpl', $data));
    }

    public function reward()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->hasPermission('modify', 'beneficiary/beneficiary')) {
            $this->model_beneficiary_beneficiary->addReward($this->request->get['beneficiary_id'], $this->request->post['description'], $this->request->post['points']);

            $data['success'] = $this->language->get('text_success');
        } else {
            $data['success'] = '';
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$this->user->hasPermission('modify', 'beneficiary/beneficiary')) {
            $data['error_warning'] = $this->language->get('error_permission');
        } else {
            $data['error_warning'] = '';
        }

        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_balance'] = $this->language->get('text_balance');

        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_description'] = $this->language->get('column_description');
        $data['column_points'] = $this->language->get('column_points');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['rewards'] = array();

        $results = $this->model_beneficiary_beneficiary->getRewards($this->request->get['beneficiary_id'], ($page - 1) * 10, 10);

        foreach ($results as $result) {
            $data['rewards'][] = array(
                'points' => $result['points'],
                'description' => $result['description'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
            );
        }

        $data['balance'] = $this->model_beneficiary_beneficiary->getRewardTotal($this->request->get['beneficiary_id']);

        $reward_total = $this->model_beneficiary_beneficiary->getTotalRewards($this->request->get['beneficiary_id']);

        $pagination = new Pagination();
        $pagination->total = $reward_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('beneficiary/beneficiary/reward', 'token='.$this->session->data['token'].'&beneficiary_id='.$this->request->get['beneficiary_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($reward_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($reward_total - 10)) ? $reward_total : ((($page - 1) * 10) + 10), $reward_total, ceil($reward_total / 10));

        $this->response->setOutput($this->load->view('beneficiary/beneficiary_reward.tpl', $data));
    }

    public function autocomplete()
    {
        $json = array();

        if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_email'])) {
            if (isset($this->request->get['filter_name'])) {
                $filter_name = $this->request->get['filter_name'];
            } else {
                $filter_name = '';
            }

            if (isset($this->request->get['filter_email'])) {
                $filter_email = $this->request->get['filter_email'];
            } else {
                $filter_email = '';
            }

            $this->load->model('beneficiary/beneficiary');

            $filter_data = array(
                'filter_name' => $filter_name,
                'filter_email' => $filter_email,
                'start' => 0,
                'limit' => 5,
            );

            $results = $this->model_beneficiary_beneficiary->getbeneficiarys($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'beneficiary_id' => $result['customer_id'],
                    'beneficiary_group_id' => $result['beneficiary_group_id'],
                    'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
                    'beneficiary_group' => $result['beneficiary_group'],
                    'firstname' => $result['firstname'],
                    'lastname' => $result['lastname'],
                    'email' => $result['email'],
                    'telephone' => $result['telephone'],
                    'fax' => $result['fax'],
                    'custom_field' => json_decode($result['custom_field']),
                    'bankaccount' => $this->model_beneficiary_beneficiary->getbankaccounts($result['customer_id']),
                );
            }
        }

        $sort_order = array();

        foreach ($json as $key => $value) {
            $sort_order[$key] = $value['name'];
        }

        array_multisort($sort_order, SORT_ASC, $json);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function customfield()
    {
        $json = array();

        $this->load->model('customer/custom_field');

        // beneficiary Group
        if (isset($this->request->get['beneficiary_group_id'])) {
            $beneficiary_group_id = $this->request->get['beneficiary_group_id'];
        } else {
            $beneficiary_group_id = $this->config->get('config_beneficiary_group_id');
        }

        $custom_fields = $this->model_customer_custom_field->getCustomFields(array('filter_beneficiary_group_id' => $beneficiary_group_id));

        foreach ($custom_fields as $custom_field) {
            $json[] = array(
                'custom_field_id' => $custom_field['custom_field_id'],
                'required' => empty($custom_field['required']) || $custom_field['required'] == 0 ? false : true,
            );
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function bankaccount()
    {
        $json = array();

        if (!empty($this->request->get['bankaccount_id'])) {
            $this->load->model('beneficiary/beneficiary');

            $json = $this->model_beneficiary_beneficiary->getbankaccount($this->request->get['bankaccount_id']);
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function country()
    {
        $json = array();

        $this->load->model('localisation/country');

        $country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

        if ($country_info) {
            $this->load->model('localisation/zone');

            $json = array(
                'country_id' => $country_info['country_id'],
                'name' => $country_info['name'],
                'iso_code_2' => $country_info['iso_code_2'],
                'iso_code_3' => $country_info['iso_code_3'],
                'bankaccount_format' => $country_info['bankaccount_format'],
                'postcode_required' => $country_info['postcode_required'],
                'zone' => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
                'status' => $country_info['status'],
            );
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function beneficiary_add_image()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        if ($this->request->get['beneficiary_image']) {
            $this->model_beneficiary_beneficiary->beneficiaryaddimage($this->request->get['beneficiary_image'], $this->request->get['beneficiary_id']);

            $json['success'] = $this->language->get('text_add_image_success');
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function beneficiary_delete_image()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        if ($this->request->get['beneficiary_image']) {
            $this->model_beneficiary_beneficiary->beneficiarydeleteimage($this->request->get['beneficiary_id']);

            $json['success'] = $this->language->get('text_delete_image_success');
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function facebook()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        $this->model_beneficiary_beneficiary->beneficiaryfacebook($this->request->get['beneficiary_facebook'], $this->request->get['beneficiary_id']);

        $json['success'] = $this->language->get('text_add_facebook_success');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function twitter()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        $this->model_beneficiary_beneficiary->beneficiarytwitter($this->request->get['beneficiary_twitter'], $this->request->get['beneficiary_id']);

        $json['success'] = $this->language->get('text_add_twitter_success');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function googleplus()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        $this->model_beneficiary_beneficiary->beneficiarygoogleplus($this->request->get['beneficiary_googleplus'], $this->request->get['beneficiary_id']);

        $json['success'] = $this->language->get('text_add_googleplus_success');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function instagram()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        $this->model_beneficiary_beneficiary->beneficiaryinstagram($this->request->get['beneficiary_instagram'], $this->request->get['beneficiary_id']);

        $json['success'] = $this->language->get('text_add_instagram_success');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
