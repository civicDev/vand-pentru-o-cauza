<?php

class ControllerbeneficiarydashboardbeneficiaryOrder extends Controller
{
    public function index()
    {
        $this->load->language('beneficiarydashboard/beneficiary_order');

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_view'] = $this->language->get('text_view');

        $data['token'] = $this->session->data['token'];

        // Total Orders
        $this->load->model('beneficiary/order');

        $today = $this->model_beneficiary_order->getTotalOrders(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

        $yesterday = $this->model_beneficiary_order->getTotalOrders(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

        $difference = $today - $yesterday;

        if ($difference && $today) {
            $data['percentage'] = round(($difference / $today) * 100);
        } else {
            $data['percentage'] = 0;
        }

        $order_total = $this->model_beneficiary_order->getTotalOrders();

        if ($order_total > 1000000000000) {
            $data['total'] = round($order_total / 1000000000000, 1).'T';
        } elseif ($order_total > 1000000000) {
            $data['total'] = round($order_total / 1000000000, 1).'B';
        } elseif ($order_total > 1000000) {
            $data['total'] = round($order_total / 1000000, 1).'M';
        } elseif ($order_total > 1000) {
            $data['total'] = round($order_total / 1000, 1).'K';
        } else {
            $data['total'] = $order_total;
        }

        $data['order'] = $this->url->link('beneficiary/order', 'token='.$this->session->data['token'], 'SSL');

        return $this->load->view('beneficiarydashboard/beneficiary_order.tpl', $data);
    }
}
