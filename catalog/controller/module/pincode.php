<?php

class ControllerModulePincode extends Controller {

    protected function index($setting) {
        $this->language->load('module/pincode');

        $this->data['heading_title'] = $this->language->get('heading_title');



        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pincode.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/module/pincode.tpl';
        } else {
            $this->template = 'default/template/module/pincode.tpl';
        }

        $this->render();
    }

    public function pinCheck() {
        $this->load->model('catalog/pincode');
        $pin = array();
        if (isset($_POST['pincode'])) {
            $_SESSION['pin_check_status'] = "1";
            $pincode = $_POST['pincode'];
            $_SESSION['pincode'] = $_POST['pincode'];
            $pin = $this->model_catalog_pincode->getPin($pincode);

            $message_cod = $message_pre = $message_not = '';
            $message_cod = $this->config->get('pincode_msg_codavailable');
            $message_pre = $this->config->get('pincode_msg_preavailable');
            $message_not = $this->config->get('pincode_msg_unavailable');
            $message_for_both = $this->config->get('pincode_msg_for_both');
            $text_color = $this->config->get('text_color');

            if (!isset($message_cod)) {
                $message_cod = "COD Services Are Available";
            }
            if (!isset($message_pre)) {
                $message_pre = "Only Prepaid Service is Available";
            }
            if (!isset($message_not)) {
                $message_not = "Service is not Available at your location yet";
            }
            if (!isset($message_for_both)) {
                $message_for_both = "Service is not Available at your location yet";
            }


//                echo '<pre>';
//                print_r($pin);
            if (!empty($pin)) {
                if (count($pin) == '2') {
                    echo "<img src='image/pincode/l.png' width='15' height='15'>Delivery option for: " . $_SESSION['pincode'] . "&nbsp;&nbsp;<form><input type = 'button'  onClick = 'showform()' value='Change' class='button' /></form><br />";
                    echo "<img src='image/pincode/check.png' width='15' height='15'>Status: <font color = '" . $text_color . "'>" . $message_for_both . "</font><br />";

                    $_SESSION['pin_check_result'] = "<img src='image/pincode/check.png' width='15' height='15'>Status: <font color = '" . $text_color . "'>" . $message_for_both . "</font>";
                } else {
                    foreach ($pin as $pincode) {
                        $service = $pincode['service_available'];
                        if ($service == '1') {
                            echo "<img src='image/pincode/l.png' width='15' height='15'>Delivery option for: " . $_SESSION['pincode'] . "&nbsp;&nbsp;<form><input type = 'button'  onClick = 'showform()' value='Change' class='button' /></form><br />";
                            echo "<img src='image/pincode/check.png' width='15' height='15'>Status: <font color = '" . $text_color . "'>" . $message_cod . "</font></font><br />";

                            $_SESSION['pin_check_result'] = "<img src='image/pincode/check.png' width='15' height='15'>Status: <font color = '" . $text_color . "'>" . $message_cod . "</font>";
                        } else if ($service == '0') {
                            echo "<img src='image/pincode/l.png' width='15' height='15'>Delivery option for: " . $_SESSION['pincode'] . "&nbsp;&nbsp;<form><input type = 'button'  onClick = 'showform()' value='Change' class='button' /></form><br />";
                            echo "<img src='image/pincode/check.png' width='15' height='15'>Status: <font color = '" . $text_color . "'>" . $message_pre . "</font><br />";

                            $_SESSION['pin_check_result'] = "<img src='image/pincode/check.png' width='15' height='15'>Status: <font color = '" . $text_color . "'>" . $message_pre . "</font>";
                        } else {
                            echo "<img src='image/pincode/l.png' width='15' height='15'>Delivery option for: " . $_SESSION['pincode'] . "&nbsp;&nbsp;<form><input type = 'button'  onClick = 'showform()' value='Change' class='button' /></form><br />";
                            echo "<img src='image/pincode/x.png' width='15' height='15'>Status:<font color = '" . $text_color . "'>" . $message_not . "</font><br />";

                            $_SESSION['pin_check_result'] = "<img src='image/pincode/x.png' width='15' height='15'>Status: <font color = '" . $text_color . "'>" . $message_not . "</font>";
                        }
                    }
                }
            } else {
                echo "<img src='image/pincode/l.png' width='15' height='15'>Delivery option for: " . $_SESSION['pincode'] . "&nbsp;&nbsp;<form><input type = 'button'  onClick = 'showform()' value='Change' class='button' /></form><br />";
                echo "<img src='image/pincode/x.png' width='15' height='15'>Status<font color = '" . $text_color . "'>:" . $message_not . "</font><br />";
                $_SESSION['pin_check_result'] = "<img src='image/pincode/x.png' width='15' height='15'>Status:<font color = '" . $text_color . "'>" . $message_not . "</font>";
            }
        }
    }

}

?>