<?php

class ControllerbeneficiarydashboardbeneficiarySale extends Controller
{
    public function index()
    {
        $this->load->language('beneficiarydashboard/beneficiary_sale');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_view'] = $this->language->get('text_view');

        $data['token'] = $this->session->data['token'];

        $this->load->model('beneficiarydashboard/sale');

        $today = $this->model_beneficiarydashboard_sale->getTotalSales(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

        $yesterday = $this->model_beneficiarydashboard_sale->getTotalSales(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

        $difference = $today - $yesterday;

        if ($difference && $today) {
            $data['percentage'] = round(($difference / $today) * 100);
        } else {
            $data['percentage'] = 0;
        }

        $sale_total = $this->model_beneficiarydashboard_sale->getTotalSales();

        if ($sale_total > 1000000000000) {
            $data['total'] = round($sale_total / 1000000000000, 1).'T';
        } elseif ($sale_total > 1000000000) {
            $data['total'] = round($sale_total / 1000000000, 1).'B';
        } elseif ($sale_total > 1000000) {
            $data['total'] = round($sale_total / 1000000, 1).'M';
        } elseif ($sale_total > 1000) {
            $data['total'] = round($sale_total / 1000, 1).'K';
        } else {
            $data['total'] = round($sale_total);
        }

        $data['sale'] = $this->url->link('beneficiary/order', 'token='.$this->session->data['token'], 'SSL');

        return $this->load->view('beneficiarydashboard/beneficiary_sale.tpl', $data);
    }
}
