<?php

class Controllerbeneficiaryprofilebeneficiaryprofile extends Controller
{
    private $error = array();

    public function index()
    {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('beneficiaryprofile/beneficiaryprofile', '', 'SSL');

            $this->response->redirect($this->url->link('account/login', '', 'SSL'));
        }

        $this->load->model('beneficiaryproduct/beneficiary');

        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('beneficiaryprofile/beneficiaryprofile');

        $data['column_beneficiary_group'] = $this->language->get('column_beneficiary_group');
        $data['column_commission'] = $this->language->get('column_commission');
        $data['column_commission_rate'] = $this->language->get('column_commission_rate');
        $data['column_subscription_price'] = $this->language->get('column_subscription_price');
        $data['column_product_limit'] = $this->language->get('column_product_limit');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_subscription_duration'] = $this->language->get('column_subscription_duration');
        $data['column_beneficiary_group_description'] = $this->language->get('column_beneficiary_group_description');
        $data['column_categories'] = $this->language->get('column_categories');

        $data['column_sort_order'] = $this->language->get('column_sort_order');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_beneficiary_detail'] = $this->language->get('text_beneficiary_detail');
        $data['text_beneficiary_profile'] = $this->language->get('text_beneficiary_profile');
        $data['entry_beneficiary_avatar'] = $this->language->get('entry_beneficiary_avatar');
        $data['text_beneficiary_group_detail'] = $this->language->get('text_beneficiary_group_detail');

        $data['text_form'] = !isset($this->request->get['beneficiary_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_select'] = $this->language->get('text_select');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_loading'] = $this->language->get('text_loading');
        $data['text_add_ban_ip'] = $this->language->get('text_add_ban_ip');
        $data['text_remove_ban_ip'] = $this->language->get('text_remove_ban_ip');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_beneficiary_group_commission'] = $this->language->get('entry_beneficiary_group_commission');
        $data['entry_beneficiary_group_commission_rate'] = $this->language->get('entry_beneficiary_group_commission_rate');
        $data['entry_date_created'] = $this->language->get('entry_date_created');
        $data['entry_date_end'] = $this->language->get('entry_date_end');
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
        $data['entry_beneficiary_group_limit'] = $this->language->get('entry_beneficiary_group_limit');
        $data['entry_beneficiary_group_subscription_price'] = $this->language->get('entry_beneficiary_group_subscription_price');
        $data['entry_beneficiary_product_total'] = $this->language->get('entry_beneficiary_product_total');
        $data['entry_beneficiary_product_left'] = $this->language->get('entry_beneficiary_product_left');

        $data['help_safe'] = $this->language->get('help_safe');
        $data['help_points'] = $this->language->get('help_points');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_bankaccount_add'] = $this->language->get('button_bankaccount_add');
        $data['button_history_add'] = $this->language->get('button_history_add');
        $data['button_transaction_add'] = $this->language->get('button_transaction_add');
        $data['button_request_membership_add'] = $this->language->get('button_request_membership_add');
        $data['entry_facebook'] = $this->language->get('entry_facebook');
        $data['entry_twitter'] = $this->language->get('entry_twitter');
        $data['entry_googleplus'] = $this->language->get('entry_googleplus');
        $data['entry_instagram'] = $this->language->get('entry_instagram');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['button_upload'] = $this->language->get('button_upload');

        $data['tab_general'] = $this->language->get('tab_general');
        $data['tab_bankaccount'] = $this->language->get('tab_bankaccount');
        $data['tab_history'] = $this->language->get('tab_history');
        $data['tab_badge'] = $this->language->get('tab_badge');
        $data['tab_beneficiaryproduct'] = $this->language->get('tab_beneficiaryproduct');
        $data['tab_transaction'] = $this->language->get('tab_transaction');
        $data['tab_request_membership'] = $this->language->get('tab_request_membership');
        $data['tab_more_details'] = $this->language->get('tab_more_details');
        $data['tab_ip'] = $this->language->get('tab_ip');

        if ($this->config->get('config_beneficiary_agree_id')) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('config_beneficiary_agree_id'));

            if ($information_info) {
                $data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id='.$this->config->get('config_beneficiary_agree_id'), 'SSL'), $information_info['title'], $information_info['title']);
            } else {
                $data['text_agree'] = '';
            }
        } else {
            $data['text_agree'] = '';
        }

        if (isset($information_info['title'])) {
            $data['text_beneficiary_agree'] = sprintf($this->language->get('text_beneficiary_agree'), $information_info['title']);
        }

        $this->load->model('beneficiaryprofile/beneficiaryprofile');
        $data['banks'] = $this->model_beneficiaryprofile_beneficiaryprofile->getbankes();

        $data['beneficiary_id'] = $this->customer->getId();

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', '', 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('beneficiaryprofile/beneficiaryprofile', '', 'SSL'),
        );

        $data['cancel'] = $this->url->link('account/account', '', 'SSL');

        $beneficiary_info = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiary($this->customer->getId());

        $data['beneficiary_product_total'] = $this->model_beneficiaryprofile_beneficiaryprofile->getTotalProducts();

        $this->load->model('beneficiaryprofile/beneficiaryprofile');

        $data['beneficiary_groups'] = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiaryGroups();

        if (isset($this->request->post['beneficiary_group_id'])) {
            $data['beneficiary_group_id'] = $this->request->post['beneficiary_group_id'];
        } elseif (!empty($beneficiary_info)) {
            $data['beneficiary_group_id'] = $beneficiary_info['beneficiary_group_id'];
        } else {
            $data['beneficiary_group_id'] = $this->config->get('config_beneficiary_group_id');
        }
        $this->load->model('tool/image');
        if ($this->config->get('config_beneficiaryimageupload')) {
            $data['beneficiaryimageupload'] = '1';
        } else {
            $data['beneficiaryimageupload'] = '0';
        }
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
        if (isset($this->request->post['beneficiary_group'])) {
            $data['beneficiary_group'] = $this->request->post['beneficiary_group'];
        } elseif (!empty($beneficiary_info)) {
            $results = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiaryGroup($beneficiary_info['beneficiary_group_id']);
            foreach ($results as $result) {
                $data['beneficiary_group_info'][] = array(
                'rate' => ($result['type'] == 'F' ? $this->currency->format($result['rate']) : intval($result['rate']).'% '),
                'commission_name' => $result['commission_name'],
                'type' => $result['type'],
            );
            }

            $this->load->model('beneficiaryproduct/beneficiary');

            $data['is_beneficiary'] = $this->customer->isbeneficiary();

            $data['beneficiary_group'] = $beneficiary_info['name'];
        } else {
            $data['beneficiary_group'] = '';
        }

        if (isset($this->request->post['beneficiary_group_limit'])) {
            $data['beneficiary_group_limit'] = $this->request->post['beneficiary_group_limit'];
        } elseif (!empty($beneficiary_info)) {
            $data['beneficiary_group_limit'] = $beneficiary_info['product_limit'];
        } else {
            $data['beneficiary_group_limit'] = '';
        }
        if (isset($this->request->post['description'])) {
            $data['description'] = $this->request->post['description'];
        } elseif (!empty($beneficiary_info)) {
            $data['description'] = $beneficiary_info['description'];
        } else {
            $data['description'] = '';
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

        if (isset($this->request->post['beneficiary_group_subscription_price'])) {
            $data['beneficiary_group_subscription_price'] = $this->request->post['beneficiary_group_subscription_price'];
        } elseif (!empty($beneficiary_info)) {
            $data['beneficiary_group_subscription_price'] = $this->currency->format($beneficiary_info['subscription_price']);
        } else {
            $data['beneficiary_group_subscription_price'] = '';
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

        if (isset($this->request->post['date'])) {
            $data['date'] = $this->request->post['date'];
        } elseif (!empty($beneficiary_info)) {
            $data['date'] = date($this->language->get('date_format_short'), strtotime($beneficiary_info['beneficiary_date_added']));
        } else {
            $data['date'] = '';
        }

        if (!empty($beneficiary_info) && $beneficiary_info['subscription_duration'] != 0) {
            $data['date_end'] = date($this->language->get('date_format_short'), strtotime('+'.$beneficiary_info['subscription_duration'].'months', strtotime($beneficiary_info['beneficiary_date_added'])));
        } else {
            $data['date_end'] = $this->language->get('text_unlimited');
        }

        $data['text_unlimited'] = $this->language->get('text_unlimited');

        if (isset($this->request->post['bankaccount'])) {
            $data['bankaccounts'] = $this->request->post['bankaccount'];
        } elseif (isset($this->request->get['beneficiary_id'])) {
            $data['bankaccounts'] = $this->model_beneficiaryprofile_beneficiaryprofile->getbankaccounts($this->customer->getId());
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

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        if (isset($this->request->post['beneficiary_group_id'])) {
            $data['beneficiary_group_id'] = $this->request->post['beneficiary_group_id'];
        } else {
            $data['beneficiary_group_id'] = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiarygroupId();
        }

        

        $this->load->model('beneficiaryproduct/beneficiary');

        $data['beneficiary_request'] = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiaryrequest();
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'cgd.name';
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
            'href' => $this->url->link('common/dashboard', '', 'SSL'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('beneficiaryprofile/beneficiaryprofile',  $url, 'SSL'),
        );

        $data['column_commission'] = $this->language->get('column_commission');
        $data['column_commission_rate'] = $this->language->get('column_commission_rate');

        $this->load->model('beneficiaryproduct/category');
        $this->load->model('beneficiaryproduct/product');



        $data['beneficiary_groups'] = array();

        $filter_data = array(
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin'),
        );

        $beneficiary_product_total = $this->model_beneficiaryprofile_beneficiaryprofile->getTotalProducts();

        $results = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiaryGroups($filter_data);

        foreach ($results as $result) {
            $data['beneficiary_groups'][] = array(
                'beneficiary_group_id' => $result['beneficiary_group_id'],
                'beneficiary_categories' => $this->model_beneficiaryproduct_category->getCategories($result['beneficiary_group_id']),
                'name' => $result['name'],
                'sort_order' => $result['sort_order'],
                'description' => $result['description'],
                'product_limit' => $result['product_limit'],
                'text_subscription_duration' => sprintf($this->language->get('text_subscription_duration'), $result['subscription_duration']),
                'subscription_price' => $this->currency->format($result['subscription_price']),
                'subscription_duration' => $result['subscription_duration'],
                'beneficiary_group_commission' =>$result['commission_name'],
                'categories' => $this->model_beneficiaryproduct_product->getbeneficiaryCategories($this->customer->getID()),
                'beneficiary_group_commission_rate' =>  ($result['type'] == "F") ? $this->currency->format($result['rate']) : $result['rate']."%" ,


                );
        }
				$data['error_warning_product_limit'] = '';
        if (!empty($beneficiary_info)) {
					if ($beneficiary_info['product_limit'] != 0) {


            if ($beneficiary_product_total >= $beneficiary_info['product_limit']) {
                $data['error_warning_product_limit'] = $this->language->get('warning_product_limit');
            } else {
                $data['error_warning_product_limit'] = '';
            }

						}
        } else {
            $data['error_warning_product_limit'] = '';
        }



        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_name'] = $this->language->get('column_name');
        $data['column_sort_order'] = $this->language->get('column_sort_order');
        $data['column_product_limit'] = $this->language->get('column_product_limit');
        $data['column_subscription_price'] = $this->language->get('column_subscription_price');
        $data['column_action'] = $this->language->get('column_action');

        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');

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

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page='.$this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('beneficiaryprofile/beneficiaryprofile',  '&sort=cgd.name'.$url, 'SSL');
        $data['sort_sort_order'] = $this->url->link('beneficiaryprofile/beneficiaryprofile',  '&sort=cg.sort_order'.$url, 'SSL');
        $data['sort_product_limit'] = $this->url->link('beneficiaryprofile/beneficiaryprofile',  '&sort=cg.product_limit'.$url, 'SSL');
        $data['sort_subscription_price'] = $this->url->link('beneficiaryprofile/beneficiaryprofile',  '&sort=cg.subscription_price'.$url, 'SSL');

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort='.$this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order='.$this->request->get['order'];
        }

        $data['sort'] = $sort;
        $data['order'] = $order;

        if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_form.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_form.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/beneficiaryprofile/beneficiaryprofile_form.tpl', $data));
        }
    }

    public function approve()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('beneficiaryprofile/beneficiaryprofile');

        $beneficiarys = array();

        if (isset($this->request->post['selected'])) {
            $beneficiarys = $this->request->post['selected'];
        } elseif (isset($this->request->get['beneficiary_id'])) {
            $beneficiarys[] = $this->request->get['beneficiary_id'];
        }

        if ($beneficiarys && $this->validateApprove()) {
            $this->model_beneficiaryprofile_beneficiaryprofile->approve($this->request->get['beneficiary_id']);

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

            $this->response->redirect($this->url->link('beneficiaryprofile/beneficiaryprofile', $url, 'SSL'));
        }

        $this->getList();
    }

    public function disapprove()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('beneficiaryprofile/beneficiaryprofile');

        $disapprove_comment = $this->language->get('disapprove_comment');
        $this->model_beneficiaryprofile_beneficiaryprofile->addHistory($this->customer->getId(), $disapprove_comment);
        $this->model_beneficiaryprofile_beneficiaryprofile->disapprove($this->customer->getId());
    }

    public function badge()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->load->model('beneficiaryprofile/beneficiaryprofile');

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
            $data['beneficiary_badge'] = $this->model_beneficiaryprofile_beneficiaryprofile->getbadgebeneficiary($this->request->get['beneficiary_id']);
        } else {
            $data['beneficiary_badge'] = array($this->config->get('config_badge_id'));
        }

        $data['beneficiary_badge'] = $this->model_beneficiaryprofile_beneficiaryprofile->getbadgebeneficiary($this->customer->getId());

        $data['badges'] = array();

        $results = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiarybadges();

        $this->load->model('tool/image');

        foreach ($results as $result) {
            $data['badges'][] = array(
            'badge_id' => $result['badge_id'],
                'title' => $result['title'],
                'image' => (is_file(DIR_IMAGE.$result['image']) ? $this->model_tool_image->resize($result['image'], 40, 40) : $this->model_tool_image->resize('no_image.png', 40, 40)),
            );
        }

        if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_badge.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_badge.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/beneficiaryprofile/beneficiaryprofile_badge.tpl', $data));
        }
    }

    public function beneficiaryproduct()
    {
        $this->load->language('beneficiaryproduct/product');
        $this->load->language('beneficiaryprofile/beneficiaryprofile');
        $this->load->model('beneficiaryprofile/beneficiaryprofile');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['entry_beneficiaryproduct'] = $this->language->get('entry_beneficiaryproduct');
        $data['text_no_results'] = $this->language->get('text_no_results');

        $data['button_edit_mode'] = $this->language->get('button_edit_mode');
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

        if (isset($this->request->post['beneficiaryprofile_beneficiaryprofileproduct'])) {
            $data['beneficiaryprofile_beneficiaryprofileproduct'] = $this->request->post['beneficiaryprofile_beneficiaryprofileproduct'];
        } elseif (isset($this->request->get['beneficiary_id'])) {
            $data['beneficiaryprofile_beneficiaryprofileproduct'] = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiaryproducts($this->request->get['beneficiary_id']);
        } else {
            $data['beneficiaryprofile_beneficiaryprofileproduct'] = array($this->config->get('config_beneficiaryproduct_id'));
        }

        $data['edit'] = $this->url->link('beneficiaryproduct/product/', '', 'SSL');

        $data['products'] = array();

        $this->load->model('tool/image');
        $this->load->model('beneficiaryproduct/product');
        //$product_total = $this->model_catalog_product->getTotalProducts();

        $results = $this->model_beneficiaryprofile_beneficiaryprofile->getProducts(($page - 1) * 10, 10);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE.$result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 40, 40);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 40, 40);
            }

            $special = false;

            $product_specials = $this->model_beneficiaryproduct_product->getProductSpecials($result['product_id']);

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
        );
        }

        $product_total = $this->model_beneficiaryprofile_beneficiaryprofile->getTotalProducts();

        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('beneficiaryprofile/beneficiaryprofile/beneficiaryproduct', 'beneficiary_id='.$this->request->get['beneficiary_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($product_total - 10)) ? $product_total : ((($page - 1) * 10) + 10), $product_total, ceil($product_total / 10));

        if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_beneficiaryproduct.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_beneficiaryproduct.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/beneficiaryprofile/beneficiaryprofile_beneficiaryproduct.tpl', $data));
        }
    }

    public function history()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->load->model('beneficiaryprofile/beneficiaryprofile');

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

        $results = $this->model_beneficiaryprofile_beneficiaryprofile->getHistories($this->request->get['beneficiary_id'], ($page - 1) * 10, 10);

        foreach ($results as $result) {
            $data['histories'][] = array(
                'comment' => $result['comment'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
            );
        }

        $history_total = $this->model_beneficiaryprofile_beneficiaryprofile->getTotalHistories($this->request->get['beneficiary_id']);

        $pagination = new Pagination();
        $pagination->total = $history_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('beneficiaryprofile/beneficiaryprofile/history', '&beneficiary_id='.$this->request->get['beneficiary_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($history_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($history_total - 10)) ? $history_total : ((($page - 1) * 10) + 10), $history_total, ceil($history_total / 10));

        if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_history.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_history.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/beneficiaryprofile/beneficiaryprofile_history.tpl', $data));
        }
    }

    public function transaction()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->load->model('beneficiaryprofile/beneficiaryprofile');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->hasPermission('modify', 'beneficiaryprofile/beneficiaryprofile')) {
            $this->model_beneficiaryprofile_beneficiaryprofile->addTransaction($this->request->get['beneficiary_id'], $this->request->post['description'], $this->request->post['amount']);

            $data['success'] = $this->language->get('text_success');
        } else {
            $data['success'] = '';
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$this->user->hasPermission('modify', 'beneficiaryprofile/beneficiaryprofile')) {
            $data['error_warning'] = $this->language->get('error_permission');
        } else {
            $data['error_warning'] = '';
        }

        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_balance'] = $this->language->get('text_balance');
        $data['text_commission'] = $this->language->get('text_commission');
        $data['text_subscription_price'] = $this->language->get('text_subscription_price');
        $data['text_total'] = $this->language->get('text_total');
        $data['text_amount'] = $this->language->get('text_amount');

        $data['column_date_added'] = $this->language->get('column_date_added');
        $data['column_description'] = $this->language->get('column_description');
        $data['column_amount'] = $this->language->get('column_amount');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['transactions'] = array();

        $results = $this->model_beneficiaryprofile_beneficiaryprofile->getTransactions($this->request->get['beneficiary_id'], ($page - 1) * 10, 10);

        foreach ($results as $result) {
            $data['transactions'][] = array(
                'amount' => $this->currency->format($result['amount']),
                'description' => $result['description'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
            );
        }

        $data['balance'] = $this->currency->format($this->model_beneficiaryprofile_beneficiaryprofile->getTransactionTotal($this->request->get['beneficiary_id']));
        $balance = $this->model_beneficiaryprofile_beneficiaryprofile->getTransactionTotal($this->request->get['beneficiary_id']);

        $beneficiary_info = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiary($this->customer->getId());
        if ($beneficiary_info) {
            $results = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiaryGroup($beneficiary_info['beneficiary_group_id']);

            foreach ($results as $result) {
                $data['beneficiary_group_info'][] = array(
            'total' => ($result['type'] == 'P' ? $this->currency->format($balance - ($balance * $result['rate'] / 100)) : $this->currency->format($balance - $result['rate'])),
                'beneficiary_commission' => ($result['type'] == 'F' ? $this->currency->format($result['rate'] * -1) : intval($result['rate'] * -1).'% '),
                'beneficiary_subscription_price' => $this->currency->format($this->currency->format($beneficiary_info['subscription_price'] * (-1))),
            );
            }
        } else {
            $data['beneficiary_group_info'][] = array(
            'total' => '0',
            'beneficiary_commission' => '0',
            'beneficiary_subscription_price' => '0',
            );
        }

        $transaction_total = $this->model_beneficiaryprofile_beneficiaryprofile->getTotalTransactions($this->request->get['beneficiary_id']);

        $pagination = new Pagination();
        $pagination->total = $transaction_total;
        $pagination->page = $page;
        $pagination->limit = 10;
        $pagination->url = $this->url->link('beneficiaryprofile/beneficiaryprofile/transaction', '&beneficiary_id='.$this->request->get['beneficiary_id'].'&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($transaction_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($transaction_total - 10)) ? $transaction_total : ((($page - 1) * 10) + 10), $transaction_total, ceil($transaction_total / 10));

        if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_transaction.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_transaction.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/beneficiaryprofile/beneficiaryprofile_transaction.tpl', $data));
        }
    }

    public function request_membership()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->load->model('beneficiaryprofile/beneficiaryprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $this->model_beneficiaryprofile_beneficiaryprofile->addrequest_membership($this->request->get['beneficiary_id'], $this->request->post);
            $this->model_beneficiaryprofile_beneficiaryprofile->addHistory($this->request->get['beneficiary_id'], sprintf($this->language->get('text_request_message'), $this->request->post['beneficiary_group_name']));

            // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('request_add', $activity_data);

            $data['success'] = $this->language->get('text_success');
        } else {
            $data['success'] = '';
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $data['error_warning'] = $this->language->get('error_permission');
        } else {
            $data['error_warning'] = '';
        }

        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_balance'] = $this->language->get('text_balance');
        $data['text_not_beneficiary'] = $this->language->get('text_not_beneficiary');
        $data['text_request'] = $this->language->get('text_request');
        $data['text_beneficiary_no_approved'] = $this->language->get('text_beneficiary_no_approved');
        $data['text_beneficiary'] = $this->language->get('text_beneficiary');
        $data['text_beneficiary_change_group'] = $this->language->get('text_beneficiary_change_group');
        $data['beneficiary_request'] = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiaryrequest();

        if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_request_membership.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template').'/template/beneficiaryprofile/beneficiaryprofile_request_membership.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/beneficiaryprofile/beneficiaryprofile_request_membership.tpl', $data));
        }
    }

    public function cancelrequest()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');
        $this->load->model('beneficiaryprofile/beneficiaryprofile');

        $json = array();

        $customer_info = $this->model_beneficiaryprofile_beneficiaryprofile->CancelRequest();

        if (!$customer_info) {
            $json['error'] = $this->language->get('error_permission');
        }

        if (!$json) {
            $this->model_beneficiaryprofile_beneficiaryprofile->addHistory($this->customer->getID(), $this->language->get('text_cancel_request'));

            $subject = sprintf($this->language->get('text_cancel_request'), $this->config->get('config_name'));

            $message = sprintf($this->language->get('text_cancel_request'), $this->config->get('config_name'))."\n\n";
            $message .= $this->language->get('text_thanks')."\n";
            $message .= $this->config->get('config_name');

            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
            $mail->setTo($this->customer->getEmail());
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender($this->config->get('config_name'));
            $mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
            $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
            $mail->send();

            $json['success'] = $this->language->get('text_resend_success');
        }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
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

            $this->load->model('beneficiaryprofile/beneficiaryprofile');

            $filter_data = array(
                'filter_name' => $filter_name,
                'filter_email' => $filter_email,
                'start' => 0,
                'limit' => 5,
            );

            $results = $this->model_beneficiaryprofile_beneficiaryprofile->getbeneficiarys($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'beneficiary_id' => $result['beneficiary_id'],
                    'beneficiary_group_id' => $result['beneficiary_group_id'],
                    'name' => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
                    'beneficiary_group' => $result['beneficiary_group'],
                    'firstname' => $result['firstname'],
                    'lastname' => $result['lastname'],
                    'email' => $result['email'],
                    'telephone' => $result['telephone'],
                    'fax' => $result['fax'],
                    'custom_field' => unserialize($result['custom_field']),
                    'bankaccount' => $this->model_beneficiaryprofile_beneficiaryprofile->getbankaccounts($result['beneficiary_id']),
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

    public function bankaccount()
    {
        $json = array();

        if (!empty($this->request->get['bankaccount_id'])) {
            $this->load->model('beneficiaryprofile/beneficiaryprofile');

            $json = $this->model_beneficiaryprofile_beneficiaryprofile->getbankaccount($this->request->get['bankaccount_id']);
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function beneficiary_add_image()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->load->model('beneficiaryprofile/beneficiaryprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        if ($this->request->get['beneficiary_image']) {
            $this->model_beneficiaryprofile_beneficiaryprofile->beneficiaryaddimage($this->request->get['beneficiary_image']);

                // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('image_add', $activity_data);

            $json['success'] = $this->language->get('text_add_image_success');
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function beneficiary_delete_image()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->load->model('beneficiaryprofile/beneficiaryprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        if ($this->request->get['beneficiary_image']) {
            $this->model_beneficiaryprofile_beneficiaryprofile->beneficiarydeleteimage();

                // Add to activity log
            $this->load->model('account/activity');

            $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

            $this->model_account_activity->addActivity('image_add', $activity_data);

            $json['success'] = $this->language->get('text_delete_image_success');
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function facebook()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->load->model('beneficiaryprofile/beneficiaryprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        $this->model_beneficiaryprofile_beneficiaryprofile->beneficiaryaddfacebook($this->request->get['beneficiary_facebook']);

                // Add to activity log
            $this->load->model('account/activity');

        $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

        $this->model_account_activity->addActivity('facebook_add', $activity_data);

        $json['success'] = $this->language->get('text_add_facebook_success');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function twitter()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->load->model('beneficiaryprofile/beneficiaryprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        $this->model_beneficiaryprofile_beneficiaryprofile->beneficiaryaddtwitter($this->request->get['beneficiary_twitter']);

                // Add to activity log
            $this->load->model('account/activity');

        $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

        $this->model_account_activity->addActivity('twitter_add', $activity_data);

        $json['success'] = $this->language->get('text_add_twitter_success');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function googleplus()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->load->model('beneficiaryprofile/beneficiaryprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        $this->model_beneficiaryprofile_beneficiaryprofile->beneficiaryaddgoogleplus($this->request->get['beneficiary_googleplus']);

                // Add to activity log
            $this->load->model('account/activity');

        $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

        $this->model_account_activity->addActivity('googleplus_add', $activity_data);

        $json['success'] = $this->language->get('text_add_googleplus_success');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function instagram()
    {
        $this->load->language('beneficiaryprofile/beneficiaryprofile');

        $this->load->model('beneficiaryprofile/beneficiaryprofile');
        $data['text_request_message'] = $this->language->get('text_request_message');

        $json = array();

        $this->model_beneficiaryprofile_beneficiaryprofile->beneficiaryaddinstagram($this->request->get['beneficiary_instagram']);

                // Add to activity log
            $this->load->model('account/activity');

        $activity_data = array(
                'customer_id' => $this->customer->getId(),
                'name' => $this->customer->getFirstName().' '.$this->customer->getLastName(),
            );

        $this->model_account_activity->addActivity('instagram_add', $activity_data);

        $json['success'] = $this->language->get('text_add_instagram_success');

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
