<?php

class ControllerbeneficiarydashboardbeneficiaryOnline extends Controller
{
    public function index()
    {
        $this->load->language('beneficiarydashboard/beneficiary_online');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_view'] = $this->language->get('text_view');

        $data['token'] = $this->session->data['token'];

        // Total Orders
        $this->load->model('beneficiarydashboard/customer');

        // Customers Online
        $online_total = $this->model_beneficiarydashboard_customer->getTotalCustomersOnline();

        if ($online_total > 1000000000000) {
            $data['total'] = round($online_total / 1000000000000, 1).'T';
        } elseif ($online_total > 1000000000) {
            $data['total'] = round($online_total / 1000000000, 1).'B';
        } elseif ($online_total > 1000000) {
            $data['total'] = round($online_total / 1000000, 1).'M';
        } elseif ($online_total > 1000) {
            $data['total'] = round($online_total / 1000, 1).'K';
        } else {
            $data['total'] = $online_total;
        }

        $data['online'] = $this->url->link('beneficiarydashboard/customer_online', 'token='.$this->session->data['token'], 'SSL');

        return $this->load->view('beneficiarydashboard/beneficiary_online.tpl', $data);
    }
}
