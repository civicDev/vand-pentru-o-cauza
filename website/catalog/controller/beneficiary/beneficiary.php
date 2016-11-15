<?php

class Controllerbeneficiarybeneficiary extends Controller
{
    public function index()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');

        $this->load->model('tool/image');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_index'] = $this->language->get('text_index');
        $data['text_empty'] = $this->language->get('text_empty');

        $data['button_continue'] = $this->language->get('button_continue');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_brand'),
            'href' => $this->url->link('beneficiary/beneficiary'),
        );

        $data['categories'] = array();

        $results = $this->model_beneficiary_beneficiary->getbeneficiarys();

        foreach ($results as $result) {
            if (is_numeric(utf8_substr($result['name'], 0, 1))) {
                $key = '0 - 9';
            } else {
                $key = utf8_substr(utf8_strtoupper($result['name']), 0, 1);
            }

            if (!isset($data['categories'][$key])) {
                $data['categories'][$key]['name'] = $key;
            }

            $data['categories'][$key]['beneficiary'][] = array(
                'name' => $result['name'],
                'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$result['customer_id']),
            );
        }

        $data['continue'] = $this->url->link('common/home');

        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/beneficiary/beneficiary_list.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template').'/template/beneficiary/beneficiary_list.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/beneficiary/beneficiary_list.tpl', $data));
        }
    }

    public function info()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $data['beneficiaryreviewstatus'] = $this->config->get('config_beneficiaryreview');

        // Captcha
            if ($this->config->get('config_beneficiaryreview') && $this->config->get($this->config->get('config_captcha').'_status')) {
                $data['captcha'] = $this->load->controller('captcha/'.$this->config->get('config_captcha'));
            } else {
                $data['captcha'] = '';
            }

        if ($this->config->get('config_beneficiaryreview_guest') || $this->customer->isLogged()) {
            $data['beneficiaryreviewguest'] = true;
        } else {
            $data['beneficiaryreviewguest'] = false;
        }
        $data['text_beneficiary_login'] = sprintf($this->language->get('text_beneficiary_login'), $this->url->link('account/login', '', 'SSL'), $this->url->link('account/register', '', 'SSL'));

        $data['beneficiary_id'] = (int) $this->request->get['beneficiary_id'];
        $data['text_write'] = $this->language->get('text_write');
        $data['entry_name'] = $this->language->get('entry_name');
        $data['text_loading'] = $this->language->get('text_loading');
        $data['entry_beneficiaryreview'] = $this->language->get('entry_beneficiaryreview');
        $data['entry_rating'] = $this->language->get('entry_rating');
        $data['entry_good'] = $this->language->get('entry_good');
        $data['entry_bad'] = $this->language->get('entry_bad');
        $data['entry_captcha'] = $this->language->get('entry_captcha');
        $data['text_note'] = $this->language->get('text_note');

        if (isset($this->request->get['beneficiary_id'])) {
            $beneficiary_id = (int) $this->request->get['beneficiary_id'];
        } else {
            $beneficiary_id = 0;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'p.sort_order';
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

        if (isset($this->request->get['limit'])) {
            $limit = $this->request->get['limit'];
        } else {
            $limit = $this->config->get('config_product_limit');
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home'),
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_brand'),
            'href' => $this->url->link('beneficiary/beneficiary'),
        );

        $beneficiary_info = $this->model_beneficiary_beneficiary->getbeneficiary($beneficiary_id);

        if ($beneficiary_info) {
            $this->document->setTitle($beneficiary_info['title']);
            $this->document->addLink($this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id']), 'canonical');

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

            if (isset($this->request->get['limit'])) {
                $url .= '&limit='.$this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $beneficiary_info['title'],
                'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].$url),
            );

            $data['heading_title'] = $beneficiary_info['title'];
            $data['beneficiary_name'] = $beneficiary_info['title'];
            $this->load->model('tool/image');
            if ($this->config->get('config_beneficiaryprofileimage')) {
                $data['beneficiaryprofileimage'] = '1';
            } else {
                $data['beneficiaryprofileimage'] = '0';
            }

            if ($beneficiary_info['image']) {
                $data['beneficiary_image'] = $this->model_tool_image->resize($beneficiary_info['image'], 90, 90);
            } else {
                $data['beneficiary_image'] = $this->model_tool_image->resize('placeholder.png', 90, 90);
            }
            $data['beneficiary_rating'] = (int) $beneficiary_info['rating'];

            $data['text_empty'] = $this->language->get('text_empty');
            $data['text_quantity'] = $this->language->get('text_quantity');
            $data['text_beneficiary'] = $this->language->get('text_beneficiary');
            $data['text_model'] = $this->language->get('text_model');
            $data['text_price'] = $this->language->get('text_price');
            $data['text_tax'] = $this->language->get('text_tax');
            $data['text_points'] = $this->language->get('text_points');
            $data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
            $data['text_sort'] = $this->language->get('text_sort');
            $data['text_limit'] = $this->language->get('text_limit');

            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');
            $data['button_continue'] = $this->language->get('button_continue');
            $data['button_list'] = $this->language->get('button_list');
            $data['button_grid'] = $this->language->get('button_grid');

            $data['compare'] = $this->url->link('beneficiary/compare');

            $data['products'] = array();

            $filter_data = array(
                'filter_beneficiary_id' => $beneficiary_id,
                'sort' => $sort,
                'order' => $order,
                'start' => ($page - 1) * $limit,
                'limit' => $limit,
            );

            $product_total = $this->model_beneficiary_beneficiary->getTotalProducts($filter_data);

            $results = $this->model_beneficiary_beneficiary->getProducts($filter_data);

            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                }

                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $price = false;
                }

                if ((float) $result['special']) {
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
                } else {
                    $special = false;
                }

                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float) $result['special'] ? $result['special'] : $result['price']);
                } else {
                    $tax = false;
                }

                if ($this->config->get('config_review_status')) {
                    $rating = (int) $result['rating'];
                } else {
                    $rating = false;
                }

                $data['products'][] = array(
                    'product_id' => $result['product_id'],
                    'thumb' => $image,
                    'name' => $result['name'],
                    'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')).'..',
                    'price' => $price,
                    'special' => $special,
                    'tax' => $tax,
                    'rating' => $result['rating'],
                    'href' => $this->url->link('product/product', '&product_id='.$result['product_id'].$url),
                );
            }

            $url = '';

            if (isset($this->request->get['limit'])) {
                $url .= '&limit='.$this->request->get['limit'];
            }

            $data['sorts'] = array();

            $data['sorts'][] = array(
                'text' => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].'&sort=p.sort_order&order=ASC'.$url),
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].'&sort=pd.name&order=ASC'.$url),
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].'&sort=pd.name&order=DESC'.$url),
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].'&sort=p.price&order=ASC'.$url),
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].'&sort=p.price&order=DESC'.$url),
            );

            if ($this->config->get('config_review_status')) {
                $data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_desc'),
                    'value' => 'rating-DESC',
                    'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].'&sort=rating&order=DESC'.$url),
                );

                $data['sorts'][] = array(
                    'text' => $this->language->get('text_rating_asc'),
                    'value' => 'rating-ASC',
                    'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].'&sort=rating&order=ASC'.$url),
                );
            }

            $data['sorts'][] = array(
                'text' => $this->language->get('text_model_asc'),
                'value' => 'p.model-ASC',
                'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].'&sort=p.model&order=ASC'.$url),
            );

            $data['sorts'][] = array(
                'text' => $this->language->get('text_model_desc'),
                'value' => 'p.model-DESC',
                'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].'&sort=p.model&order=DESC'.$url),
            );

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            $data['limits'] = array();

            $limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));

            sort($limits);

            foreach ($limits as $value) {
                $data['limits'][] = array(
                    'text' => $value,
                    'value' => $value,
                    'href' => $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].$url.'&limit='.$value),
                );
            }

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort='.$this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order='.$this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit='.$this->request->get['limit'];
            }

            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('beneficiary/beneficiary/info', 'beneficiary_id='.$this->request->get['beneficiary_id'].$url.'&page={page}');

            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

            $data['sort'] = $sort;
            $data['order'] = $order;
            $data['limit'] = $limit;

            $data['continue'] = $this->url->link('common/home');

            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/beneficiary/beneficiary_info.tpl')) {
                $this->response->setOutput($this->load->view($this->config->get('config_template').'/template/beneficiary/beneficiary_info.tpl', $data));
            } else {
                $this->response->setOutput($this->load->view('default/template/beneficiary/beneficiary_info.tpl', $data));
            }
        } else {
            $url = '';

            if (isset($this->request->get['beneficiary_id'])) {
                $url .= '&beneficiary_id='.$this->request->get['beneficiary_id'];
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

            if (isset($this->request->get['limit'])) {
                $url .= '&limit='.$this->request->get['limit'];
            }

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_error'),
                'href' => $this->url->link('beneficiary/beneficiary/info', $url),
            );

            $this->document->setTitle($this->language->get('text_error'));

            $data['heading_title'] = $this->language->get('text_error');

            $data['text_error'] = $this->language->get('text_error');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('common/home');

            $this->response->addHeader($this->request->server['SERVER_PROTOCOL'].' 404 Not Found');

            $data['header'] = $this->load->controller('common/header');
            $data['footer'] = $this->load->controller('common/footer');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');

            if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/error/not_found.tpl')) {
                $this->response->setOutput($this->load->view($this->config->get('config_template').'/template/error/not_found.tpl', $data));
            } else {
                $this->response->setOutput($this->load->view('default/template/error/not_found.tpl', $data));
            }
        }
    }

    public function autocomplete()
    {
        $json = array();

        if (isset($this->request->get['filter_name'])) {
            $this->load->model('beneficiary/beneficiary');

            $filter_data = array(
                'filter_name' => $this->request->get['filter_name'],
                'start' => 0,
                'limit' => 5,
            );

            $results = $this->model_beneficiary_beneficiary->getbeneficiarys($filter_data);

            foreach ($results as $result) {
                $json[] = array(
                    'beneficiary_id' => $result['beneficiary_id'],
                    'name' => strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8')),
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

    public function beneficiaryreview()
    {
        $this->load->language('beneficiary/beneficiary');

        $this->load->model('beneficiary/beneficiary');

        $data['text_no_beneficiaryreviews'] = $this->language->get('text_no_beneficiaryreviews');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $data['beneficiaryreviews'] = array();

        $beneficiaryreview_total = $this->model_beneficiary_beneficiary->getTotalbeneficiaryreviewsBybeneficiaryId($this->request->get['beneficiary_id']);

        $results = $this->model_beneficiary_beneficiary->getbeneficiaryreviewsBybeneficiaryId($this->request->get['beneficiary_id'], ($page - 1) * 5, 5);

        foreach ($results as $result) {
            $data['beneficiaryreviews'][] = array(
                'beneficiary_name' => $result['beneficiary_name'],
                'text' => nl2br($result['text']),
                'rating' => (int) $result['rating'],
                'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
            );
        }

        $pagination = new Pagination();
        $pagination->total = $beneficiaryreview_total;
        $pagination->page = $page;
        $pagination->limit = 5;
        $pagination->url = $this->url->link('beneficiary/beneficiary/beneficiaryreview', 'beneficiary_id='.$this->request->get['beneficiary_id'].'&page={page}');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($beneficiaryreview_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($beneficiaryreview_total - 5)) ? $beneficiaryreview_total : ((($page - 1) * 5) + 5), $beneficiaryreview_total, ceil($beneficiaryreview_total / 5));

        if (file_exists(DIR_TEMPLATE.$this->config->get('config_template').'/template/beneficiary/beneficiary_review.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template').'/template/beneficiary/beneficiary_review.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/beneficiary/beneficiary_review.tpl', $data));
        }
    }

    public function write()
    {
        $this->load->language('beneficiary/beneficiary');

        $json = array();

        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
                $json['error'] = $this->language->get('error_name');
            }

            if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
                $json['error'] = $this->language->get('error_text');
            }

            if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
                $json['error'] = $this->language->get('error_rating');
            }

            if ($this->config->get('config_beneficiaryreview') && $this->config->get($this->config->get('config_captcha').'_status')) {
                $captcha = $this->load->controller('captcha/'.$this->config->get('config_captcha').'/validate');

                if ($captcha) {
                    $json['error'] = $captcha;
                }
            }

            unset($this->session->data['captcha']);

            if (!isset($json['error'])) {
                $this->load->model('beneficiary/beneficiary');

                $this->model_beneficiary_beneficiary->addbeneficiaryReview($this->request->get['beneficiary_id'], $this->request->post);

                $json['success'] = $this->language->get('text_success');
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}
