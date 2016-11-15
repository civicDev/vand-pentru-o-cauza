<?php

class Controllerbeneficiarydashboardbeneficiary extends Controller
{
    public function index()
    {
        $this->load->language('beneficiarydashboard/beneficiary');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_view'] = $this->language->get('text_view');

        $data['token'] = $this->session->data['token'];

        // Total Orders
        $this->load->model('beneficiary/beneficiary');

        $today = $this->model_beneficiary_beneficiary->getTotalbeneficiarys(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

        $yesterday = $this->model_beneficiary_beneficiary->getTotalbeneficiarys(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

        $difference = $today - $yesterday;

        if ($difference && $today) {
            $data['percentage'] = round(($difference / $today) * 100);
        } else {
            $data['percentage'] = 0;
        }

        $beneficiary_total = $this->model_beneficiary_beneficiary->getTotalbeneficiarys();

        if ($beneficiary_total > 1000000000000) {
            $data['total'] = round($beneficiary_total / 1000000000000, 1).'T';
        } elseif ($beneficiary_total > 1000000000) {
            $data['total'] = round($beneficiary_total / 1000000000, 1).'B';
        } elseif ($beneficiary_total > 1000000) {
            $data['total'] = round($beneficiary_total / 1000000, 1).'M';
        } elseif ($beneficiary_total > 1000) {
            $data['total'] = round($beneficiary_total / 1000, 1).'K';
        } else {
            $data['total'] = $beneficiary_total;
        }

        $data['beneficiary'] = $this->url->link('beneficiary/beneficiary', 'token='.$this->session->data['token'], 'SSL');

        return $this->load->view('beneficiarydashboard/beneficiary.tpl', $data);
    }
}
