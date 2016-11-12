<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-setting" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-store" data-toggle="tab"><?php echo $tab_store; ?></a></li>
            <li><a href="#tab-local" data-toggle="tab"><?php echo $tab_local; ?></a></li>
            <li><a href="#tab-option" data-toggle="tab"><?php echo $tab_option; ?></a></li>
            <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
            <li><a href="#tab-ftp" data-toggle="tab"><?php echo $tab_ftp; ?></a></li>
            <li><a href="#tab-mail" data-toggle="tab"><?php echo $tab_mail; ?></a></li>
<li><a href="#tab-multiseller-setting" data-toggle="tab"><?php echo $tab_multiseller_setting; ?></a></li>
            <li><a href="#tab-server" data-toggle="tab"><?php echo $tab_server; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-meta-title"><?php echo $entry_meta_title; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_meta_title" value="<?php echo $config_meta_title; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title" class="form-control" />
                    <?php if ($error_meta_title) { ?>
                    <div class="text-danger"><?php echo $error_meta_title; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-meta-description"><?php echo $entry_meta_description; ?></label>
                  <div class="col-sm-10">
                    <textarea name="config_meta_description" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description" class="form-control"><?php echo $config_meta_description; ?></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-meta-keyword"><?php echo $entry_meta_keyword; ?></label>
                  <div class="col-sm-10">
                    <textarea name="config_meta_keyword" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword" class="form-control"><?php echo $config_meta_keyword; ?></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-template"><?php echo $entry_template; ?></label>
                  <div class="col-sm-10">
                    <select name="config_template" id="input-template" class="form-control">
                      <?php foreach ($templates as $template) { ?>
                      <?php if ($template == $config_template) { ?>
                      <option value="<?php echo $template; ?>" selected="selected"><?php echo $template; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $template; ?>"><?php echo $template; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                    <br />
                    <img src="" alt="" id="template" class="img-thumbnail" /></div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-layout"><?php echo $entry_layout; ?></label>
                  <div class="col-sm-10">
                    <select name="config_layout_id" id="input-layout" class="form-control">
                      <?php foreach ($layouts as $layout) { ?>
                      <?php if ($layout['layout_id'] == $config_layout_id) { ?>
                      <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                  </select></div>
              </div>
            </div>
            <div class="tab-pane" id="tab-store">
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_name" value="<?php echo $config_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                    <?php if ($error_name) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-owner"><?php echo $entry_owner; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_owner" value="<?php echo $config_owner; ?>" placeholder="<?php echo $entry_owner; ?>" id="input-owner" class="form-control" />
                    <?php if ($error_owner) { ?>
                    <div class="text-danger"><?php echo $error_owner; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-address"><?php echo $entry_address; ?></label>
                  <div class="col-sm-10">
                    <textarea name="config_address" placeholder="<?php echo $entry_address; ?>" rows="5" id="input-address" class="form-control"><?php echo $config_address; ?></textarea>
                    <?php if ($error_address) { ?>
                    <div class="text-danger"><?php echo $error_address; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-geocode"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_geocode; ?>"><?php echo $entry_geocode; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_geocode" value="<?php echo $config_geocode; ?>" placeholder="<?php echo $entry_geocode; ?>" id="input-geocode" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_email" value="<?php echo $config_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                    <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_telephone" value="<?php echo $config_telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                    <?php if ($error_telephone) { ?>
                    <div class="text-danger"><?php echo $error_telephone; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_fax" value="<?php echo $config_fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                  <div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                    <input type="hidden" name="config_image" value="<?php echo $config_image; ?>" id="input-image" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-open"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_open; ?>"><?php echo $entry_open; ?></span></label>
                  <div class="col-sm-10">
                    <textarea name="config_open" rows="5" placeholder="<?php echo $entry_open; ?>" id="input-open" class="form-control"><?php echo $config_open; ?></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-comment"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_comment; ?>"><?php echo $entry_comment; ?></span></label>
                  <div class="col-sm-10">
                    <textarea name="config_comment" rows="5" placeholder="<?php echo $entry_comment; ?>" id="input-comment" class="form-control"><?php echo $config_comment; ?></textarea>
                  </div>
                </div>
                <?php if ($locations) { ?>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_location; ?>"><?php echo $entry_location; ?></span></label>
                  <div class="col-sm-10">
                    <?php foreach ($locations as $location) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($location['location_id'], $config_location)) { ?>
                        <input type="checkbox" name="config_location[]" value="<?php echo $location['location_id']; ?>" checked="checked" />
                        <?php echo $location['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="config_location[]" value="<?php echo $location['location_id']; ?>" />
                        <?php echo $location['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>

            </div>
            <div class="tab-pane" id="tab-local">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
                <div class="col-sm-10">
                  <select name="config_country_id" id="input-country" class="form-control">
                    <?php foreach ($countries as $country) { ?>
                    <?php if ($country['country_id'] == $config_country_id) { ?>
                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                <div class="col-sm-10">
                  <select name="config_zone_id" id="input-zone" class="form-control">
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-language"><?php echo $entry_language; ?></label>
                <div class="col-sm-10">
                  <select name="config_language" id="input-language" class="form-control">
                    <?php foreach ($languages as $language) { ?>
                    <?php if ($language['code'] == $config_language) { ?>
                    <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-admin-language"><?php echo $entry_admin_language; ?></label>
                <div class="col-sm-10">
                  <select name="config_admin_language" id="input-admin-language" class="form-control">
                    <?php foreach ($languages as $language) { ?>
                    <?php if ($language['code'] == $config_admin_language) { ?>
                    <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-currency"><span data-toggle="tooltip" title="<?php echo $help_currency; ?>"><?php echo $entry_currency; ?></span></label>
                <div class="col-sm-10">
                  <select name="config_currency" id="input-currency" class="form-control">
                    <?php foreach ($currencies as $currency) { ?>
                    <?php if ($currency['code'] == $config_currency) { ?>
                    <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_currency_auto; ?>"><?php echo $entry_currency_auto; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_currency_auto) { ?>
                    <input type="radio" name="config_currency_auto" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_currency_auto" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_currency_auto) { ?>
                    <input type="radio" name="config_currency_auto" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_currency_auto" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
                <div class="col-sm-10">
                  <select name="config_length_class_id" id="input-length-class" class="form-control">
                    <?php foreach ($length_classes as $length_class) { ?>
                    <?php if ($length_class['length_class_id'] == $config_length_class_id) { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
                <div class="col-sm-10">
                  <select name="config_weight_class_id" id="input-weight-class" class="form-control">
                    <?php foreach ($weight_classes as $weight_class) { ?>
                    <?php if ($weight_class['weight_class_id'] == $config_weight_class_id) { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-option">
              <fieldset>
                <legend><?php echo $text_product; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_product_count; ?>"><?php echo $entry_product_count; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_product_count) { ?>
                      <input type="radio" name="config_product_count" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_product_count" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_product_count) { ?>
                      <input type="radio" name="config_product_count" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_product_count" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-catalog-limit"><span data-toggle="tooltip" title="<?php echo $help_product_limit; ?>"><?php echo $entry_product_limit; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_product_limit" value="<?php echo $config_product_limit; ?>" placeholder="<?php echo $entry_product_limit; ?>" id="input-catalog-limit" class="form-control" />
                    <?php if ($error_product_limit) { ?>
                    <div class="text-danger"><?php echo $error_product_limit; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-list-description-limit"><span data-toggle="tooltip" title="<?php echo $help_product_description_length; ?>"><?php echo $entry_product_description_length; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_product_description_length" value="<?php echo $config_product_description_length; ?>" placeholder="<?php echo $entry_product_description_length; ?>" id="input-list-description-limit" class="form-control" />
                    <?php if ($error_product_description_length) { ?>
                    <div class="text-danger"><?php echo $error_product_description_length; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-admin-limit"><span data-toggle="tooltip" title="<?php echo $help_limit_admin; ?>"><?php echo $entry_limit_admin; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_limit_admin" value="<?php echo $config_limit_admin; ?>" placeholder="<?php echo $entry_limit_admin; ?>" id="input-admin-limit" class="form-control" />
                    <?php if ($error_limit_admin) { ?>
                    <div class="text-danger"><?php echo $error_limit_admin; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_review; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_review; ?>"><?php echo $entry_review; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_review_status) { ?>
                      <input type="radio" name="config_review_status" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_status" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_review_status) { ?>
                      <input type="radio" name="config_review_status" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_status" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_review_guest; ?>"><?php echo $entry_review_guest; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_review_guest) { ?>
                      <input type="radio" name="config_review_guest" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_guest" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_review_guest) { ?>
                      <input type="radio" name="config_review_guest" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_guest" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_review_mail; ?>"><?php echo $entry_review_mail; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_review_mail) { ?>
                      <input type="radio" name="config_review_mail" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_mail" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_review_mail) { ?>
                      <input type="radio" name="config_review_mail" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_mail" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_voucher; ?></legend>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-voucher-min"><span data-toggle="tooltip" title="<?php echo $help_voucher_min; ?>"><?php echo $entry_voucher_min; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_voucher_min" value="<?php echo $config_voucher_min; ?>" placeholder="<?php echo $entry_voucher_min; ?>" id="input-voucher-min" class="form-control" />
                    <?php if ($error_voucher_min) { ?>
                    <div class="text-danger"><?php echo $error_voucher_min; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-voucher-max"><span data-toggle="tooltip" title="<?php echo $help_voucher_max; ?>"><?php echo $entry_voucher_max; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_voucher_max" value="<?php echo $config_voucher_max; ?>" placeholder="<?php echo $entry_voucher_max; ?>" id="input-voucher-max" class="form-control" />
                    <?php if ($error_voucher_max) { ?>
                    <div class="text-danger"><?php echo $error_voucher_max; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_tax; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $entry_tax; ?></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_tax) { ?>
                      <input type="radio" name="config_tax" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_tax" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_tax) { ?>
                      <input type="radio" name="config_tax" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_tax" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tax-default"><span data-toggle="tooltip" title="<?php echo $help_tax_default; ?>"><?php echo $entry_tax_default; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_tax_default" id="input-tax-default" class="form-control">
                      <option value=""><?php echo $text_none; ?></option>
                      <?php  if ($config_tax_default == 'shipping') { ?>
                      <option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
                      <?php } else { ?>
                      <option value="shipping"><?php echo $text_shipping; ?></option>
                      <?php } ?>
                      <?php  if ($config_tax_default == 'payment') { ?>
                      <option value="payment" selected="selected"><?php echo $text_payment; ?></option>
                      <?php } else { ?>
                      <option value="payment"><?php echo $text_payment; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tax-customer"><span data-toggle="tooltip" title="<?php echo $help_tax_customer; ?>"><?php echo $entry_tax_customer; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_tax_customer" id="input-tax-customer" class="form-control">
                      <option value=""><?php echo $text_none; ?></option>
                      <?php  if ($config_tax_customer == 'shipping') { ?>
                      <option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
                      <?php } else { ?>
                      <option value="shipping"><?php echo $text_shipping; ?></option>
                      <?php } ?>
                      <?php  if ($config_tax_customer == 'payment') { ?>
                      <option value="payment" selected="selected"><?php echo $text_payment; ?></option>
                      <?php } else { ?>
                      <option value="payment"><?php echo $text_payment; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_account; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_online; ?>"><?php echo $entry_customer_online; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_customer_online) { ?>
                      <input type="radio" name="config_customer_online" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_customer_online" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_customer_online) { ?>
                      <input type="radio" name="config_customer_online" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_customer_online" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-customer-group"><span data-toggle="tooltip" title="<?php echo $help_customer_group; ?>"><?php echo $entry_customer_group; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_customer_group_id" id="input-customer-group" class="form-control">
                      <?php foreach ($customer_groups as $customer_group) { ?>
                      <?php if ($customer_group['customer_group_id'] == $config_customer_group_id) { ?>
                      <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_group_display; ?>"><?php echo $entry_customer_group_display; ?></span></label>
                  <div class="col-sm-10">
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($customer_group['customer_group_id'], $config_customer_group_display)) { ?>
                        <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                        <?php echo $customer_group['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                        <?php echo $customer_group['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                    <?php if ($error_customer_group_display) { ?>
                    <div class="text-danger"><?php echo $error_customer_group_display; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_price; ?>"><?php echo $entry_customer_price; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_customer_price) { ?>
                      <input type="radio" name="config_customer_price" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_customer_price" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_customer_price) { ?>
                      <input type="radio" name="config_customer_price" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_customer_price" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-login-attempts"><span data-toggle="tooltip" title="<?php echo $help_login_attempts; ?>"><?php echo $entry_login_attempts; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_login_attempts" value="<?php echo $config_login_attempts; ?>" placeholder="<?php echo $entry_login_attempts; ?>" id="input-login-attempts" class="form-control" />
                    <?php if ($error_login_attempts) { ?>
                    <div class="text-danger"><?php echo $error_login_attempts; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-account"><span data-toggle="tooltip" title="<?php echo $help_account; ?>"><?php echo $entry_account; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_account_id" id="input-account" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($informations as $information) { ?>
                      <?php if ($information['information_id'] == $config_account_id) { ?>
                      <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_account_mail; ?>"><?php echo $entry_account_mail; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_account_mail) { ?>
                      <input type="radio" name="config_account_mail" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_account_mail" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_account_mail) { ?>
                      <input type="radio" name="config_account_mail" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_account_mail" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_checkout; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-invoice-prefix"><span data-toggle="tooltip" title="<?php echo $help_invoice_prefix; ?>"><?php echo $entry_invoice_prefix; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_invoice_prefix" value="<?php echo $config_invoice_prefix; ?>" placeholder="<?php echo $entry_invoice_prefix; ?>" id="input-invoice-prefix" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_cart_weight; ?>"><?php echo $entry_cart_weight; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_cart_weight) { ?>
                      <input type="radio" name="config_cart_weight" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_cart_weight" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_cart_weight) { ?>
                      <input type="radio" name="config_cart_weight" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_cart_weight" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_checkout_guest; ?>"><?php echo $entry_checkout_guest; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_checkout_guest) { ?>
                      <input type="radio" name="config_checkout_guest" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_checkout_guest" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_checkout_guest) { ?>
                      <input type="radio" name="config_checkout_guest" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_checkout_guest" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-checkout"><span data-toggle="tooltip" title="<?php echo $help_checkout; ?>"><?php echo $entry_checkout; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_checkout_id" id="input-checkout" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($informations as $information) { ?>
                      <?php if ($information['information_id'] == $config_checkout_id) { ?>
                      <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-order-status"><span data-toggle="tooltip" title="<?php echo $help_order_status; ?>"><?php echo $entry_order_status; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_order_status_id" id="input-order-status" class="form-control">
                      <?php foreach ($order_statuses as $order_status) { ?>
                      <?php if ($order_status['order_status_id'] == $config_order_status_id) { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-process-status"><span data-toggle="tooltip" title="<?php echo $help_processing_status; ?>"><?php echo $entry_processing_status; ?></span></label>
                  <div class="col-sm-10">
                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($order_statuses as $order_status) { ?>
                      <div class="checkbox">
                        <label>
                          <?php if (in_array($order_status['order_status_id'], $config_processing_status)) { ?>
                          <input type="checkbox" name="config_processing_status[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
                          <?php echo $order_status['name']; ?>
                          <?php } else { ?>
                          <input type="checkbox" name="config_processing_status[]" value="<?php echo $order_status['order_status_id']; ?>" />
                          <?php echo $order_status['name']; ?>
                          <?php } ?>
                        </label>
                      </div>
                      <?php } ?>
                    </div>
                    <?php if ($error_processing_status) { ?>
                    <div class="text-danger"><?php echo $error_processing_status; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-complete-status"><span data-toggle="tooltip" title="<?php echo $help_complete_status; ?>"><?php echo $entry_complete_status; ?></span></label>
                  <div class="col-sm-10">
                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($order_statuses as $order_status) { ?>
                      <div class="checkbox">
                        <label>
                          <?php if (in_array($order_status['order_status_id'], $config_complete_status)) { ?>
                          <input type="checkbox" name="config_complete_status[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
                          <?php echo $order_status['name']; ?>
                          <?php } else { ?>
                          <input type="checkbox" name="config_complete_status[]" value="<?php echo $order_status['order_status_id']; ?>" />
                          <?php echo $order_status['name']; ?>
                          <?php } ?>
                        </label>
                      </div>
                      <?php } ?>
                    </div>
                    <?php if ($error_complete_status) { ?>
                    <div class="text-danger"><?php echo $error_complete_status; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-fraud-status"><span data-toggle="tooltip" title="<?php echo $help_fraud_status; ?>"><?php echo $entry_fraud_status; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_fraud_status_id" id="input-fraud-status" class="form-control">
                      <?php foreach ($order_statuses as $order_status) { ?>
                      <?php if ($order_status['order_status_id'] == $config_fraud_status_id) { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_order_mail; ?>"><?php echo $entry_order_mail; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_order_mail) { ?>
                      <input type="radio" name="config_order_mail" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_order_mail" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_order_mail) { ?>
                      <input type="radio" name="config_order_mail" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_order_mail" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-api"><span data-toggle="tooltip" title="<?php echo $help_api; ?>"><?php echo $entry_api; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_api_id" id="input-api" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($apis as $api) { ?>
                      <?php if ($api['api_id'] == $config_api_id) { ?>
                      <option value="<?php echo $api['api_id']; ?>" selected="selected"><?php echo $api['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $api['api_id']; ?>"><?php echo $api['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_stock; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_stock_display; ?>"><?php echo $entry_stock_display; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_stock_display) { ?>
                      <input type="radio" name="config_stock_display" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_display" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_stock_display) { ?>
                      <input type="radio" name="config_stock_display" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_display" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_stock_warning; ?>"><?php echo $entry_stock_warning; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_stock_warning) { ?>
                      <input type="radio" name="config_stock_warning" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_warning" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_stock_warning) { ?>
                      <input type="radio" name="config_stock_warning" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_warning" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_stock_checkout; ?>"><?php echo $entry_stock_checkout; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_stock_checkout) { ?>
                      <input type="radio" name="config_stock_checkout" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_checkout" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_stock_checkout) { ?>
                      <input type="radio" name="config_stock_checkout" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_checkout" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_affiliate; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_affiliate_approval; ?>"><?php echo $entry_affiliate_approval; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_affiliate_approval) { ?>
                      <input type="radio" name="config_affiliate_approval" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_approval" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_affiliate_approval) { ?>
                      <input type="radio" name="config_affiliate_approval" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_approval" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_affiliate_auto; ?>"><?php echo $entry_affiliate_auto; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_stock_checkout) { ?>
                      <input type="radio" name="config_affiliate_auto" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_auto" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_stock_checkout) { ?>
                      <input type="radio" name="config_affiliate_auto" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_auto" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-affiliate-commission"><span data-toggle="tooltip" title="<?php echo $help_affiliate_commission; ?>"><?php echo $entry_affiliate_commission; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_affiliate_commission" value="<?php echo $config_affiliate_commission; ?>" placeholder="<?php echo $entry_affiliate_commission; ?>" id="input-affiliate-commission" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-affiliate"><span data-toggle="tooltip" title="<?php echo $help_affiliate; ?>"><?php echo $entry_affiliate; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_affiliate_id" id="input-affiliate" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($informations as $information) { ?>
                      <?php if ($information['information_id'] == $config_affiliate_id) { ?>
                      <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_affiliate_mail; ?>"><?php echo $entry_affiliate_mail; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_affiliate_mail) { ?>
                      <input type="radio" name="config_affiliate_mail" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_mail" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_affiliate_mail) { ?>
                      <input type="radio" name="config_affiliate_mail" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_mail" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_return; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-return"><span data-toggle="tooltip" title="<?php echo $help_return; ?>"><?php echo $entry_return; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_return_id" id="input-return" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($informations as $information) { ?>
                      <?php if ($information['information_id'] == $config_return_id) { ?>
                      <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-return-status"><span data-toggle="tooltip" title="<?php echo $help_return_status; ?>"><?php echo $entry_return_status; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_return_status_id" id="input-return-status" class="form-control">
                      <?php foreach ($return_statuses as $return_status) { ?>
                      <?php if ($return_status['return_status_id'] == $config_return_status_id) { ?>
                      <option value="<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $return_status['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $return_status['return_status_id']; ?>"><?php echo $return_status['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_captcha; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_captcha; ?>"><?php echo $entry_captcha; ?></span></label>
                  <div class="col-sm-10">
                      <select name="config_captcha" id="input-return" class="form-control">
                        <option value=""><?php echo $text_none; ?></option>
                        <?php foreach ($captchas as $captcha) { ?>
                        <?php if ($captcha['value'] == $config_captcha) { ?>
                        <option value="<?php echo $captcha['value']; ?>" selected="selected"><?php echo $captcha['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $captcha['value']; ?>"><?php echo $captcha['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $entry_captcha_page; ?></label>
                  <div class="col-sm-10">
                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($captcha_pages as $captcha_page) { ?>
                      <div class="checkbox">
                        <label>
                          <?php if (in_array($captcha_page['value'], $config_captcha_page)) { ?>
                          <input type="checkbox" name="config_captcha_page[]" value="<?php echo $captcha_page['value']; ?>" checked="checked" />
                          <?php echo $captcha_page['text']; ?>
                          <?php } else { ?>
                          <input type="checkbox" name="config_captcha_page[]" value="<?php echo $captcha_page['value']; ?>" />
                          <?php echo $captcha_page['text']; ?>
                          <?php } ?>
                        </label>
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="tab-pane" id="tab-image">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-logo"><?php echo $entry_logo; ?></label>
                <div class="col-sm-10"><a href="" id="thumb-logo" data-toggle="image" class="img-thumbnail"><img src="<?php echo $logo; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="config_logo" value="<?php echo $config_logo; ?>" id="input-logo" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-icon"><span data-toggle="tooltip" title="<?php echo $help_icon; ?>"><?php echo $entry_icon; ?></span></label>
                <div class="col-sm-10"><a href="" id="thumb-icon" data-toggle="image" class="img-thumbnail"><img src="<?php echo $icon; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="config_icon" value="<?php echo $config_icon; ?>" id="input-icon" />
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-category-width"><?php echo $entry_image_category; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_category_width" value="<?php echo $config_image_category_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-category-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_category_height" value="<?php echo $config_image_category_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_category) { ?>
                  <div class="text-danger"><?php echo $error_image_category; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-thumb-width"><?php echo $entry_image_thumb; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_thumb_width" value="<?php echo $config_image_thumb_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-thumb-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_thumb_height" value="<?php echo $config_image_thumb_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_thumb) { ?>
                  <div class="text-danger"><?php echo $error_image_thumb; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-popup-width"><?php echo $entry_image_popup; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_popup_width" value="<?php echo $config_image_popup_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-popup-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_popup_height" value="<?php echo $config_image_popup_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_popup) { ?>
                  <div class="text-danger"><?php echo $error_image_popup; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-product-width"><?php echo $entry_image_product; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_product_width" value="<?php echo $config_image_product_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-product-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_product_height" value="<?php echo $config_image_product_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_product) { ?>
                  <div class="text-danger"><?php echo $error_image_product; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-additional-width"><?php echo $entry_image_additional; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_additional_width" value="<?php echo $config_image_additional_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-additional-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_additional_height" value="<?php echo $config_image_additional_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_additional) { ?>
                  <div class="text-danger"><?php echo $error_image_additional; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-related"><?php echo $entry_image_related; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_related_width" value="<?php echo $config_image_related_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-related" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_related_height" value="<?php echo $config_image_related_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_related) { ?>
                  <div class="text-danger"><?php echo $error_image_related; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-compare"><?php echo $entry_image_compare; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_compare_width" value="<?php echo $config_image_compare_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-compare" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_compare_height" value="<?php echo $config_image_compare_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_compare) { ?>
                  <div class="text-danger"><?php echo $error_image_compare; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-wishlist"><?php echo $entry_image_wishlist; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_wishlist_width" value="<?php echo $config_image_wishlist_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-wishlist" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_wishlist_height" value="<?php echo $config_image_wishlist_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_wishlist) { ?>
                  <div class="text-danger"><?php echo $error_image_wishlist; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-cart"><?php echo $entry_image_cart; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_cart_width" value="<?php echo $config_image_cart_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-cart" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_cart_height" value="<?php echo $config_image_cart_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_cart) { ?>
                  <div class="text-danger"><?php echo $error_image_cart; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-location"><?php echo $entry_image_location; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_location_width" value="<?php echo $config_image_location_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-location" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_location_height" value="<?php echo $config_image_location_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_location) { ?>
                  <div class="text-danger"><?php echo $error_image_location; ?></div>
                  <?php } ?>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-ftp">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ftp-host"><?php echo $entry_ftp_hostname; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_ftp_hostname" value="<?php echo $config_ftp_hostname; ?>" placeholder="<?php echo $entry_ftp_hostname; ?>" id="input-ftp-host" class="form-control" />
                  <?php if ($error_ftp_hostname) { ?>
                  <div class="text-danger"><?php echo $error_ftp_hostname; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ftp-port"><?php echo $entry_ftp_port; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_ftp_port" value="<?php echo $config_ftp_port; ?>" placeholder="<?php echo $entry_ftp_port; ?>" id="input-ftp-port" class="form-control" />
                  <?php if ($error_ftp_port) { ?>
                  <div class="text-danger"><?php echo $error_ftp_port; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ftp-username"><?php echo $entry_ftp_username; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_ftp_username" value="<?php echo $config_ftp_username; ?>" placeholder="<?php echo $entry_ftp_username; ?>" id="input-ftp-username" class="form-control" />
                  <?php if ($error_ftp_username) { ?>
                  <div class="text-danger"><?php echo $error_ftp_username; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ftp-password"><?php echo $entry_ftp_password; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_ftp_password" value="<?php echo $config_ftp_password; ?>" placeholder="<?php echo $entry_ftp_password; ?>" id="input-ftp-password" class="form-control" />
                  <?php if ($error_ftp_password) { ?>
                  <div class="text-danger"><?php echo $error_ftp_password; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ftp-root"><span data-toggle="tooltip" data-html="true" title="<?php echo htmlspecialchars($help_ftp_root); ?>"><?php echo $entry_ftp_root; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_ftp_root" value="<?php echo $config_ftp_root; ?>" placeholder="<?php echo $entry_ftp_root; ?>" id="input-ftp-root" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_ftp_status; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_ftp_status) { ?>
                    <input type="radio" name="config_ftp_status" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_ftp_status" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_ftp_status) { ?>
                    <input type="radio" name="config_ftp_status" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_ftp_status" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-mail">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-protocol"><span data-toggle="tooltip" title="<?php echo $help_mail_protocol; ?>"><?php echo $entry_mail_protocol; ?></span></label>
                <div class="col-sm-10">
                  <select name="config_mail_protocol" id="input-mail-protocol" class="form-control">
                    <?php if ($config_mail_protocol == 'mail') { ?>
                    <option value="mail" selected="selected"><?php echo $text_mail; ?></option>
                    <?php } else { ?>
                    <option value="mail"><?php echo $text_mail; ?></option>
                    <?php } ?>
                    <?php if ($config_mail_protocol == 'smtp') { ?>
                    <option value="smtp" selected="selected"><?php echo $text_smtp; ?></option>
                    <?php } else { ?>
                    <option value="smtp"><?php echo $text_smtp; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-parameter"><span data-toggle="tooltip" title="<?php echo $help_mail_parameter; ?>"><?php echo $entry_mail_parameter; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_parameter" value="<?php echo $config_mail_parameter; ?>" placeholder="<?php echo $entry_mail_parameter; ?>" id="input-mail-parameter" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-smtp-hostname"><span data-toggle="tooltip" title="<?php echo $help_mail_smtp_hostname; ?>"><?php echo $entry_mail_smtp_hostname; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_smtp_hostname" value="<?php echo $config_mail_smtp_hostname; ?>" placeholder="<?php echo $entry_mail_smtp_hostname; ?>" id="input-mail-smtp-hostname" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-smtp-username"><?php echo $entry_mail_smtp_username; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_smtp_username" value="<?php echo $config_mail_smtp_username; ?>" placeholder="<?php echo $entry_mail_smtp_username; ?>" id="input-mail-smtp-username" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-smtp-password"><?php echo $entry_mail_smtp_password; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_smtp_password" value="<?php echo $config_mail_smtp_password; ?>" placeholder="<?php echo $entry_mail_smtp_password; ?>" id="input-mail-smtp-password" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-smtp-port"><?php echo $entry_mail_smtp_port; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_smtp_port" value="<?php echo $config_mail_smtp_port; ?>" placeholder="<?php echo $entry_mail_smtp_port; ?>" id="input-mail-smtp-port" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-smtp-timeout"><?php echo $entry_mail_smtp_timeout; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_smtp_timeout" value="<?php echo $config_mail_smtp_timeout; ?>" placeholder="<?php echo $entry_mail_smtp_timeout; ?>" id="input-mail-smtp-timeout" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-alert-email"><span data-toggle="tooltip" title="<?php echo $help_mail_alert; ?>"><?php echo $entry_mail_alert; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="config_mail_alert" rows="5" placeholder="<?php echo $entry_mail_alert; ?>" id="input-alert-email" class="form-control"><?php echo $config_mail_alert; ?></textarea>
                </div>
              </div>
            </div>
<div class="tab-pane" id="tab-multiseller-setting">
			
						
					        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-multisellergeneral" data-toggle="tab"><?php echo $tab_multisellergeneral; ?></a></li>
            <li><a href="#tab-multisellerproductsetting" data-toggle="tab"><?php echo $tab_multisellerproductsetting; ?></a></li>
         
					</ul>
					
					<div class="tab-content">
						<div class="tab-pane active" id="tab-multisellergeneral">
			 <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-account"><span data-toggle="tooltip" title=""><?php echo $text_seller_agree; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_seller_agree_id" id="input-account" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($informations as $information) { ?>
                      <?php if ($information['information_id'] == $config_seller_agree_id) { ?>
                      <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
  
			
									
						
									<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerreview-status"><?php echo $text_sellerreview; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerreview" value="1" <?php if($config_sellerreview==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerreview" value="0" <?php if($config_sellerreview==0 || !$config_sellerreview){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerreview-display-image"><?php echo $text_sellerreviewguest; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerreview_guest" value="1" <?php if($config_sellerreview_guest==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerreview_guest" value="0" <?php if($config_sellerreview_guest==0 || !$config_sellerreview_guest){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
					
  
           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerimageupload-status"><?php echo $text_sellerimageupload; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerimageupload" value="1" <?php if($config_sellerimageupload==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerimageupload" value="0" <?php if($config_sellerimageupload==0 || !$config_sellerimageupload){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>	
					
							  
							  
							           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerprofileimage-status"><?php echo $text_sellerprofileimage; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerprofileimage" value="1" <?php if($config_sellerprofileimage==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerprofileimage" value="0" <?php if($config_sellerprofileimage==0 || !$config_sellerprofileimage){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
							  
							  
							           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerproductname-status"><?php echo $text_sellerproductname; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerproductname" value="1" <?php if($config_sellerproductname==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerproductname" value="0" <?php if($config_sellerproductname==0 || !$config_sellerproductname){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
							  		           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerproductimage-status"><?php echo $text_sellerproductimage; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerproductimage" value="1" <?php if($config_sellerproductimage==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerproductimage" value="0" <?php if($config_sellerproductimage==0 || !$config_sellerproductimage){echo $chk;}?> /> <?php echo $text_no; ?></label></div>	  
							  </div>
							  
							  				           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerproductrating-status"><?php echo $text_sellerproductrating; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerproductrating" value="1" <?php if($config_sellerproductrating==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerproductrating" value="0" <?php if($config_sellerproductrating==0 || !$config_sellerproductrating){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
							  
							  					           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerproductcount-status"><?php echo $text_sellerproductcount; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerproductcount" value="1" <?php if($config_sellerproductcount==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerproductcount" value="0" <?php if($config_sellerproductcount==0 || !$config_sellerproductcount){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
							  
							  
							           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerproductdateofcreat-status"><?php echo $text_sellerproductdateofcreat; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerproductdateofcreat" value="1" <?php if($config_sellerproductdateofcreat==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerproductdateofcreat" value="0" <?php if($config_sellerproductdateofcreat==0 || !$config_sellerproductdateofcreat){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
							  
							  
							           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerproductbadge-status"><?php echo $text_sellerproductbadge; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerproductbadge" value="1" <?php if($config_sellerproductbadge==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerproductbadge" value="0" <?php if($config_sellerproductbadge==0 || !$config_sellerproductbadge){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
							  
							  					           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerfacebook-status"><?php echo $text_sellerfacebook; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerfacebook" value="1" <?php if($config_sellerfacebook==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerfacebook" value="0" <?php if($config_sellerfacebook==0 || !$config_sellerfacebook){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
							  					           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellertwitter-status"><?php echo $text_sellertwitter; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellertwitter" value="1" <?php if($config_sellertwitter==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellertwitter" value="0" <?php if($config_sellertwitter==0 || !$config_sellertwitter){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
							  					           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellergoogleplus-status"><?php echo $text_sellergoogleplus; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellergoogleplus" value="1" <?php if($config_sellergoogleplus==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellergoogleplus" value="0" <?php if($config_sellergoogleplus==0 || !$config_sellergoogleplus){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
							  					           						<?php $chk = 'checked="checked"';?>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="sellerinstagram-status"><?php echo $text_sellerinstagram; ?></label>
							<div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_sellerinstagram" value="1" <?php if($config_sellerinstagram==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_sellerinstagram" value="0" <?php if($config_sellerinstagram==0 || !$config_sellerinstagram){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
						</div>
  
  

  
						</div> <!-- // tab-multisellergeneral end // -->
						<div class="tab-pane" id="tab-multisellerproductsetting">
		                       <ul class="nav nav-tabs">
            <li class="active"><a href="#tabM-general" data-toggle="tab">General</a></li>
            <li><a href="#tabM-data" data-toggle="tab">Data</a>|<label class="radio-inline"><input type="radio" name="config_multiseller_tab_data" value="1" <?php if($config_multiseller_tab_data==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_tab_data" value="0" <?php if($config_multiseller_tab_data==0 || !$config_multiseller_tab_data){echo $chk;}?> /> <?php echo $text_no; ?></label></li>
            <li><a href="#tabM-links" data-toggle="tab">Links</a>|<label class="radio-inline"><input type="radio" name="config_multiseller_tab_links" value="1" <?php if($config_multiseller_tab_links==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_tab_links" value="0" <?php if($config_multiseller_tab_links==0 || !$config_multiseller_tab_links){echo $chk;}?> /> <?php echo $text_no; ?></label></li>
            <li><a href="#tabM-attribute" data-toggle="tab">Attribute</a>|<label class="radio-inline"><input type="radio" name="config_multiseller_tab_attribute" value="1" <?php if($config_multiseller_tab_attribute==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_tab_attribute" value="0" <?php if($config_multiseller_tab_attribute==0 || !$config_multiseller_tab_attribute){echo $chk;}?> /> <?php echo $text_no; ?></label></li>
            <li><a href="#tabM-option" data-toggle="tab">Option</a>|<label class="radio-inline"><input type="radio" name="config_multiseller_tab_options" value="1" <?php if($config_multiseller_tab_options==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_tab_options" value="0" <?php if($config_multiseller_tab_options==0 || !$config_multiseller_tab_options){echo $chk;}?> /> <?php echo $text_no; ?></label></li>
            <li><a href="#tabM-recurring" data-toggle="tab">Recurring</a>|<label class="radio-inline"><input type="radio" name="config_multiseller_tab_recurring" value="1" <?php if($config_multiseller_tab_recurring==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_tab_recurring" value="0" <?php if($config_multiseller_tab_recurring==0 || !$config_multiseller_tab_recurring){echo $chk;}?> /> <?php echo $text_no; ?></label></li>
            <li><a href="#tabM-discount" data-toggle="tab">Discount</a>|<label class="radio-inline"><input type="radio" name="config_multiseller_tab_discount" value="1" <?php if($config_multiseller_tab_discount==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_tab_discount" value="0" <?php if($config_multiseller_tab_discount==0 || !$config_multiseller_tab_discount){echo $chk;}?> /> <?php echo $text_no; ?></label></li>
            <li><a href="#tabM-special" data-toggle="tab">Special</a>|<label class="radio-inline"><input type="radio" name="config_multiseller_tab_special" value="1" <?php if($config_multiseller_tab_special==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_tab_special" value="0" <?php if($config_multiseller_tab_special==0 || !$config_multiseller_tab_special){echo $chk;}?> /> <?php echo $text_no; ?></label></li>
            <li><a href="#tabM-image" data-toggle="tab">Image</a>|<label class="radio-inline"><input type="radio" name="config_multiseller_tab_image" value="1" <?php if($config_multiseller_tab_image==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_tab_image" value="0" <?php if($config_multiseller_tab_image==0 || !$config_multiseller_tab_image){echo $chk;}?> /> <?php echo $text_no; ?></label></li>
            <li><a href="#tabM-reward" data-toggle="tab">Reward Points</a>|<label class="radio-inline"><input type="radio" name="config_multiseller_tab_reward_points" value="1" <?php if($config_multiseller_tab_reward_points==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_tab_reward_points" value="0" <?php if($config_multiseller_tab_reward_points==0 || !$config_multiseller_tab_reward_points){echo $chk;}?> /> <?php echo $text_no; ?></label></li>
            <li><a href="#tabM-design" data-toggle="tab">Design</a>|<label class="radio-inline"><input type="radio" name="config_multiseller_tab_design" value="1" <?php if($config_multiseller_tab_design==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_tab_design" value="0" <?php if($config_multiseller_tab_design==0 || !$config_multiseller_tab_design){echo $chk;}?> /> <?php echo $text_no; ?></label></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tabM-general">
              <ul class="nav nav-tabs" id="language">
                                <li class="active"><a href="#language1" data-toggle="tab" aria-expanded="true"><img src="view/image/flags/gb.png" title="English"> English</a></li>
                              </ul>
              <div class="tab-content">
                                <div class="tab-pane active" id="language1">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name1">Product Name</label>
                    <div class="col-sm-7">
                      <input type="text" name="product_description[1][name]" value="" placeholder="Product Name" id="input-name1" class="form-control">
                                          </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description1">Description</label>
                    <div class="col-sm-7">
                      <textarea name="product_description[1][description]" placeholder="Description" id="input-description1" style="display: none;"></textarea><div class="note-editor"><div class="note-dropzone"><div class="note-dropzone-message"></div></div><div class="note-dialog"><div class="note-image-dialog modal" aria-hidden="false"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" aria-hidden="true" tabindex="-1">×</button><h4 class="modal-title">Insert Image</h4></div><form class="note-modal-form"><div class="modal-body"><div class="row-fluid"><div class="note-group-select-from-files"><h5>Select from files</h5><input class="note-image-input" type="file" name="files" accept="image/*"></div><h5>Image URL</h5><input class="note-image-url form-control span12" type="text"></div></div><div class="modal-footer"><button href="#" class="btn btn-primary note-image-btn disabled" disabled="">Insert Image</button></div></form></div></div></div><div class="note-link-dialog modal" aria-hidden="false"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" aria-hidden="true" tabindex="-1">×</button><h4 class="modal-title">Insert Link</h4></div><form class="note-modal-form"><div class="modal-body"><div class="row-fluid"><div class="form-group"><label>Text to display</label><input class="note-link-text form-control span12" type="text"></div><div class="form-group"><label>To what URL should this link go?</label><input class="note-link-url form-control span12" type="text"></div><div class="checkbox"><label><input type="checkbox" checked=""> Open in new window</label></div></div></div><div class="modal-footer"><button href="#" class="btn btn-primary note-link-btn disabled" disabled="">Insert Link</button></div></form></div></div></div><div class="note-video-dialog modal" aria-hidden="false"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" aria-hidden="true" tabindex="-1">×</button><h4 class="modal-title">Insert Video</h4></div><form class="note-modal-form"><div class="modal-body"><div class="row-fluid"><div class="form-group"><label>Video URL?</label>&nbsp;<small class="text-muted">(YouTube, Vimeo, Vine, Instagram, DailyMotion or Youku)</small><input class="note-video-url form-control span12" type="text"></div></div></div><div class="modal-footer"><button href="#" class="btn btn-primary note-video-btn disabled" disabled="">Insert Video</button></div></form></div></div></div><div class="note-help-dialog modal" aria-hidden="false"><div class="modal-dialog"><div class="modal-content"><form class="note-modal-form"><div class="modal-body"><div class="row-fluid"><a class="modal-close pull-right" aria-hidden="true" tabindex="-1">Close</a><div class="title">Keyboard shortcuts</div><p class="text-center"><a href="//hackerwins.github.io/summernote/" target="_blank">Summernote 0.5.8</a> · <a href="//github.com/HackerWins/summernote" target="_blank">Project</a> · <a href="//github.com/HackerWins/summernote/issues" target="_blank">Issues</a></p><table class="note-shortcut-layout"><tbody><tr><td><table class="note-shortcut"><thead><tr><th></th><th>Action</th></tr></thead><tbody><tr><td>Ctrl + Z</td><td>Undo</td></tr><tr><td>Ctrl + Shift + Z</td><td>Redo</td></tr><tr><td>Ctrl + ]</td><td>Indent</td></tr><tr><td>Ctrl + [</td><td>Outdent</td></tr><tr><td>Ctrl + ENTER</td><td>Insert Horizontal Rule</td></tr></tbody></table></td><td><table class="note-shortcut"><thead><tr><th></th><th>Text formatting</th></tr></thead><tbody><tr><td>Ctrl + B</td><td>Bold</td></tr><tr><td>Ctrl + I</td><td>Italic</td></tr><tr><td>Ctrl + U</td><td>Underline</td></tr><tr><td>Ctrl + Shift + S</td><td>Strikethrough</td></tr><tr><td>Ctrl + \</td><td>Remove Font Style</td></tr></tbody></table></td></tr><tr><td><table class="note-shortcut"><thead><tr><th></th><th>Document Style</th></tr></thead><tbody><tr><td>Ctrl + NUM0</td><td>Normal</td></tr><tr><td>Ctrl + NUM1</td><td>Header 1</td></tr><tr><td>Ctrl + NUM2</td><td>Header 2</td></tr><tr><td>Ctrl + NUM3</td><td>Header 3</td></tr><tr><td>Ctrl + NUM4</td><td>Header 4</td></tr><tr><td>Ctrl + NUM5</td><td>Header 5</td></tr><tr><td>Ctrl + NUM6</td><td>Header 6</td></tr></tbody></table></td><td><table class="note-shortcut"><thead><tr><th></th><th>Paragraph formatting</th></tr></thead><tbody><tr><td>Ctrl + Shift + L</td><td>Align left</td></tr><tr><td>Ctrl + Shift + E</td><td>Align center</td></tr><tr><td>Ctrl + Shift + R</td><td>Align right</td></tr><tr><td>Ctrl + Shift + J</td><td>Justify full</td></tr><tr><td>Ctrl + Shift + NUM7</td><td>Ordered list</td></tr><tr><td>Ctrl + Shift + NUM8</td><td>Unordered list</td></tr></tbody></table></td></tr></tbody></table></div></div></form></div></div></div></div><div class="note-handle"><div class="note-control-selection"><div class="note-control-selection-bg"></div><div class="note-control-holder note-control-nw"></div><div class="note-control-holder note-control-ne"></div><div class="note-control-holder note-control-sw"></div><div class="note-control-sizing note-control-se"></div><div class="note-control-selection-info"></div></div></div><div class="note-popover"><div class="note-link-popover popover bottom in" style="display: none;"><div class="arrow"></div><div class="popover-content"><a href="http://www.google.com" target="_blank">www.google.com</a>&nbsp;&nbsp;<div class="note-insert btn-group"><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="showLinkDialog" tabindex="-1" data-original-title="Edit (CTRL+K)"><i class="fa fa-edit icon-edit"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="unlink" tabindex="-1" data-original-title="Unlink"><i class="fa fa-unlink icon-unlink"></i></button></div></div></div><div class="note-image-popover popover bottom in" style="display: none;"><div class="arrow"></div><div class="popover-content"><div class="btn-group"><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="resize" data-value="1" tabindex="-1" data-original-title="Resize Full"><span class="note-fontsize-10">100%</span></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="resize" data-value="0.5" tabindex="-1" data-original-title="Resize Half"><span class="note-fontsize-10">50%</span></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="resize" data-value="0.25" tabindex="-1" data-original-title="Resize Quarter"><span class="note-fontsize-10">25%</span></button></div><div class="btn-group"><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="floatMe" data-value="left" tabindex="-1" data-original-title="Float Left"><i class="fa fa-align-left icon-align-left"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="floatMe" data-value="right" tabindex="-1" data-original-title="Float Right"><i class="fa fa-align-right icon-align-right"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="floatMe" data-value="none" tabindex="-1" data-original-title="Float None"><i class="fa fa-align-justify icon-align-justify"></i></button></div><div class="btn-group"><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="removeMedia" data-value="none" tabindex="-1" data-original-title="Remove Image"><i class="fa fa-trash-o icon-trash"></i></button></div></div></div></div><div class="note-toolbar btn-toolbar"><div class="note-style btn-group"><button type="button" class="btn btn-default btn-sm btn-small dropdown-toggle" data-toggle="dropdown" title="" tabindex="-1" data-original-title="Style"><i class="fa fa-magic icon-magic"></i> <span class="caret"></span></button><ul class="dropdown-menu"><li><a data-event="formatBlock" href="#" data-value="p">Normal</a></li><li><a data-event="formatBlock" href="#" data-value="blockquote"><blockquote>Quote</blockquote></a></li><li><a data-event="formatBlock" href="#" data-value="pre">Code</a></li><li><a data-event="formatBlock" href="#" data-value="h1"><h1>Header 1</h1></a></li><li><a data-event="formatBlock" href="#" data-value="h2"><h2>Header 2</h2></a></li><li><a data-event="formatBlock" href="#" data-value="h3"><h3>Header 3</h3></a></li><li><a data-event="formatBlock" href="#" data-value="h4"><h4>Header 4</h4></a></li><li><a data-event="formatBlock" href="#" data-value="h5"><h5>Header 5</h5></a></li><li><a data-event="formatBlock" href="#" data-value="h6"><h6>Header 6</h6></a></li></ul></div><div class="note-font btn-group"><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="bold" tabindex="-1" data-original-title="Bold (CTRL+B)"><i class="fa fa-bold icon-bold"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="italic" tabindex="-1" data-original-title="Italic (CTRL+I)"><i class="fa fa-italic icon-italic"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="underline" tabindex="-1" data-original-title="Underline (CTRL+U)"><i class="fa fa-underline icon-underline"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="superscript" tabindex="-1" data-original-title="Superscript"><i class="fa fa-superscript icon-superscript"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="subscript" tabindex="-1" data-original-title="Subscript"><i class="fa fa-subscript icon-subscript"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="strikethrough" tabindex="-1" data-original-title="Strikethrough (CTRL+SHIFT+S)"><i class="fa fa-strikethrough icon-strikethrough"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="removeFormat" tabindex="-1" data-original-title="Remove Font Style (CTRL+\)"><i class="fa fa-eraser icon-eraser"></i></button></div><div class="note-fontname btn-group"><button type="button" class="btn btn-default btn-sm btn-small dropdown-toggle" data-toggle="dropdown" title="" tabindex="-1" data-original-title="Font Family"><span class="note-current-fontname">Helvetica Neue</span> <span class="caret"></span></button><ul class="dropdown-menu"><li><a data-event="fontName" href="#" data-value="Arial"><i class="fa fa-check icon-ok"></i> Arial</a></li><li><a data-event="fontName" href="#" data-value="Arial Black"><i class="fa fa-check icon-ok"></i> Arial Black</a></li><li><a data-event="fontName" href="#" data-value="Comic Sans MS"><i class="fa fa-check icon-ok"></i> Comic Sans MS</a></li><li><a data-event="fontName" href="#" data-value="Courier New"><i class="fa fa-check icon-ok"></i> Courier New</a></li><li><a data-event="fontName" href="#" data-value="Impact"><i class="fa fa-check icon-ok"></i> Impact</a></li><li><a data-event="fontName" href="#" data-value="Tahoma"><i class="fa fa-check icon-ok"></i> Tahoma</a></li><li><a data-event="fontName" href="#" data-value="Times New Roman"><i class="fa fa-check icon-ok"></i> Times New Roman</a></li><li><a data-event="fontName" href="#" data-value="Verdana"><i class="fa fa-check icon-ok"></i> Verdana</a></li></ul></div><div class="note-color btn-group"><button type="button" class="btn btn-default btn-sm btn-small note-recent-color" title="" data-event="color" data-value="{&quot;backColor&quot;:&quot;yellow&quot;}" tabindex="-1" data-original-title="Recent Color"><i class="fa fa-font icon-font" style="color:black;background-color:yellow;"></i></button><button type="button" class="btn btn-default btn-sm btn-small dropdown-toggle" data-toggle="dropdown" title="" tabindex="-1" data-original-title="More Color"> <span class="caret"></span></button><ul class="dropdown-menu"><li><div class="btn-group"><div class="note-palette-title">Background Color</div><div class="note-color-reset" data-event="backColor" data-value="inherit" title="Transparent">Set transparent</div><div class="note-color-palette" data-target-event="backColor"><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#000000;" data-event="backColor" data-value="#000000" title="" data-toggle="button" tabindex="-1" data-original-title="#000000"></button><button type="button" class="note-color-btn" style="background-color:#424242;" data-event="backColor" data-value="#424242" title="" data-toggle="button" tabindex="-1" data-original-title="#424242"></button><button type="button" class="note-color-btn" style="background-color:#636363;" data-event="backColor" data-value="#636363" title="" data-toggle="button" tabindex="-1" data-original-title="#636363"></button><button type="button" class="note-color-btn" style="background-color:#9C9C94;" data-event="backColor" data-value="#9C9C94" title="" data-toggle="button" tabindex="-1" data-original-title="#9C9C94"></button><button type="button" class="note-color-btn" style="background-color:#CEC6CE;" data-event="backColor" data-value="#CEC6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#CEC6CE"></button><button type="button" class="note-color-btn" style="background-color:#EFEFEF;" data-event="backColor" data-value="#EFEFEF" title="" data-toggle="button" tabindex="-1" data-original-title="#EFEFEF"></button><button type="button" class="note-color-btn" style="background-color:#F7F7F7;" data-event="backColor" data-value="#F7F7F7" title="" data-toggle="button" tabindex="-1" data-original-title="#F7F7F7"></button><button type="button" class="note-color-btn" style="background-color:#FFFFFF;" data-event="backColor" data-value="#FFFFFF" title="" data-toggle="button" tabindex="-1" data-original-title="#FFFFFF"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#FF0000;" data-event="backColor" data-value="#FF0000" title="" data-toggle="button" tabindex="-1" data-original-title="#FF0000"></button><button type="button" class="note-color-btn" style="background-color:#FF9C00;" data-event="backColor" data-value="#FF9C00" title="" data-toggle="button" tabindex="-1" data-original-title="#FF9C00"></button><button type="button" class="note-color-btn" style="background-color:#FFFF00;" data-event="backColor" data-value="#FFFF00" title="" data-toggle="button" tabindex="-1" data-original-title="#FFFF00"></button><button type="button" class="note-color-btn" style="background-color:#00FF00;" data-event="backColor" data-value="#00FF00" title="" data-toggle="button" tabindex="-1" data-original-title="#00FF00"></button><button type="button" class="note-color-btn" style="background-color:#00FFFF;" data-event="backColor" data-value="#00FFFF" title="" data-toggle="button" tabindex="-1" data-original-title="#00FFFF"></button><button type="button" class="note-color-btn" style="background-color:#0000FF;" data-event="backColor" data-value="#0000FF" title="" data-toggle="button" tabindex="-1" data-original-title="#0000FF"></button><button type="button" class="note-color-btn" style="background-color:#9C00FF;" data-event="backColor" data-value="#9C00FF" title="" data-toggle="button" tabindex="-1" data-original-title="#9C00FF"></button><button type="button" class="note-color-btn" style="background-color:#FF00FF;" data-event="backColor" data-value="#FF00FF" title="" data-toggle="button" tabindex="-1" data-original-title="#FF00FF"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#F7C6CE;" data-event="backColor" data-value="#F7C6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#F7C6CE"></button><button type="button" class="note-color-btn" style="background-color:#FFE7CE;" data-event="backColor" data-value="#FFE7CE" title="" data-toggle="button" tabindex="-1" data-original-title="#FFE7CE"></button><button type="button" class="note-color-btn" style="background-color:#FFEFC6;" data-event="backColor" data-value="#FFEFC6" title="" data-toggle="button" tabindex="-1" data-original-title="#FFEFC6"></button><button type="button" class="note-color-btn" style="background-color:#D6EFD6;" data-event="backColor" data-value="#D6EFD6" title="" data-toggle="button" tabindex="-1" data-original-title="#D6EFD6"></button><button type="button" class="note-color-btn" style="background-color:#CEDEE7;" data-event="backColor" data-value="#CEDEE7" title="" data-toggle="button" tabindex="-1" data-original-title="#CEDEE7"></button><button type="button" class="note-color-btn" style="background-color:#CEE7F7;" data-event="backColor" data-value="#CEE7F7" title="" data-toggle="button" tabindex="-1" data-original-title="#CEE7F7"></button><button type="button" class="note-color-btn" style="background-color:#D6D6E7;" data-event="backColor" data-value="#D6D6E7" title="" data-toggle="button" tabindex="-1" data-original-title="#D6D6E7"></button><button type="button" class="note-color-btn" style="background-color:#E7D6DE;" data-event="backColor" data-value="#E7D6DE" title="" data-toggle="button" tabindex="-1" data-original-title="#E7D6DE"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#E79C9C;" data-event="backColor" data-value="#E79C9C" title="" data-toggle="button" tabindex="-1" data-original-title="#E79C9C"></button><button type="button" class="note-color-btn" style="background-color:#FFC69C;" data-event="backColor" data-value="#FFC69C" title="" data-toggle="button" tabindex="-1" data-original-title="#FFC69C"></button><button type="button" class="note-color-btn" style="background-color:#FFE79C;" data-event="backColor" data-value="#FFE79C" title="" data-toggle="button" tabindex="-1" data-original-title="#FFE79C"></button><button type="button" class="note-color-btn" style="background-color:#B5D6A5;" data-event="backColor" data-value="#B5D6A5" title="" data-toggle="button" tabindex="-1" data-original-title="#B5D6A5"></button><button type="button" class="note-color-btn" style="background-color:#A5C6CE;" data-event="backColor" data-value="#A5C6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#A5C6CE"></button><button type="button" class="note-color-btn" style="background-color:#9CC6EF;" data-event="backColor" data-value="#9CC6EF" title="" data-toggle="button" tabindex="-1" data-original-title="#9CC6EF"></button><button type="button" class="note-color-btn" style="background-color:#B5A5D6;" data-event="backColor" data-value="#B5A5D6" title="" data-toggle="button" tabindex="-1" data-original-title="#B5A5D6"></button><button type="button" class="note-color-btn" style="background-color:#D6A5BD;" data-event="backColor" data-value="#D6A5BD" title="" data-toggle="button" tabindex="-1" data-original-title="#D6A5BD"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#E76363;" data-event="backColor" data-value="#E76363" title="" data-toggle="button" tabindex="-1" data-original-title="#E76363"></button><button type="button" class="note-color-btn" style="background-color:#F7AD6B;" data-event="backColor" data-value="#F7AD6B" title="" data-toggle="button" tabindex="-1" data-original-title="#F7AD6B"></button><button type="button" class="note-color-btn" style="background-color:#FFD663;" data-event="backColor" data-value="#FFD663" title="" data-toggle="button" tabindex="-1" data-original-title="#FFD663"></button><button type="button" class="note-color-btn" style="background-color:#94BD7B;" data-event="backColor" data-value="#94BD7B" title="" data-toggle="button" tabindex="-1" data-original-title="#94BD7B"></button><button type="button" class="note-color-btn" style="background-color:#73A5AD;" data-event="backColor" data-value="#73A5AD" title="" data-toggle="button" tabindex="-1" data-original-title="#73A5AD"></button><button type="button" class="note-color-btn" style="background-color:#6BADDE;" data-event="backColor" data-value="#6BADDE" title="" data-toggle="button" tabindex="-1" data-original-title="#6BADDE"></button><button type="button" class="note-color-btn" style="background-color:#8C7BC6;" data-event="backColor" data-value="#8C7BC6" title="" data-toggle="button" tabindex="-1" data-original-title="#8C7BC6"></button><button type="button" class="note-color-btn" style="background-color:#C67BA5;" data-event="backColor" data-value="#C67BA5" title="" data-toggle="button" tabindex="-1" data-original-title="#C67BA5"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#CE0000;" data-event="backColor" data-value="#CE0000" title="" data-toggle="button" tabindex="-1" data-original-title="#CE0000"></button><button type="button" class="note-color-btn" style="background-color:#E79439;" data-event="backColor" data-value="#E79439" title="" data-toggle="button" tabindex="-1" data-original-title="#E79439"></button><button type="button" class="note-color-btn" style="background-color:#EFC631;" data-event="backColor" data-value="#EFC631" title="" data-toggle="button" tabindex="-1" data-original-title="#EFC631"></button><button type="button" class="note-color-btn" style="background-color:#6BA54A;" data-event="backColor" data-value="#6BA54A" title="" data-toggle="button" tabindex="-1" data-original-title="#6BA54A"></button><button type="button" class="note-color-btn" style="background-color:#4A7B8C;" data-event="backColor" data-value="#4A7B8C" title="" data-toggle="button" tabindex="-1" data-original-title="#4A7B8C"></button><button type="button" class="note-color-btn" style="background-color:#3984C6;" data-event="backColor" data-value="#3984C6" title="" data-toggle="button" tabindex="-1" data-original-title="#3984C6"></button><button type="button" class="note-color-btn" style="background-color:#634AA5;" data-event="backColor" data-value="#634AA5" title="" data-toggle="button" tabindex="-1" data-original-title="#634AA5"></button><button type="button" class="note-color-btn" style="background-color:#A54A7B;" data-event="backColor" data-value="#A54A7B" title="" data-toggle="button" tabindex="-1" data-original-title="#A54A7B"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#9C0000;" data-event="backColor" data-value="#9C0000" title="" data-toggle="button" tabindex="-1" data-original-title="#9C0000"></button><button type="button" class="note-color-btn" style="background-color:#B56308;" data-event="backColor" data-value="#B56308" title="" data-toggle="button" tabindex="-1" data-original-title="#B56308"></button><button type="button" class="note-color-btn" style="background-color:#BD9400;" data-event="backColor" data-value="#BD9400" title="" data-toggle="button" tabindex="-1" data-original-title="#BD9400"></button><button type="button" class="note-color-btn" style="background-color:#397B21;" data-event="backColor" data-value="#397B21" title="" data-toggle="button" tabindex="-1" data-original-title="#397B21"></button><button type="button" class="note-color-btn" style="background-color:#104A5A;" data-event="backColor" data-value="#104A5A" title="" data-toggle="button" tabindex="-1" data-original-title="#104A5A"></button><button type="button" class="note-color-btn" style="background-color:#085294;" data-event="backColor" data-value="#085294" title="" data-toggle="button" tabindex="-1" data-original-title="#085294"></button><button type="button" class="note-color-btn" style="background-color:#311873;" data-event="backColor" data-value="#311873" title="" data-toggle="button" tabindex="-1" data-original-title="#311873"></button><button type="button" class="note-color-btn" style="background-color:#731842;" data-event="backColor" data-value="#731842" title="" data-toggle="button" tabindex="-1" data-original-title="#731842"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#630000;" data-event="backColor" data-value="#630000" title="" data-toggle="button" tabindex="-1" data-original-title="#630000"></button><button type="button" class="note-color-btn" style="background-color:#7B3900;" data-event="backColor" data-value="#7B3900" title="" data-toggle="button" tabindex="-1" data-original-title="#7B3900"></button><button type="button" class="note-color-btn" style="background-color:#846300;" data-event="backColor" data-value="#846300" title="" data-toggle="button" tabindex="-1" data-original-title="#846300"></button><button type="button" class="note-color-btn" style="background-color:#295218;" data-event="backColor" data-value="#295218" title="" data-toggle="button" tabindex="-1" data-original-title="#295218"></button><button type="button" class="note-color-btn" style="background-color:#083139;" data-event="backColor" data-value="#083139" title="" data-toggle="button" tabindex="-1" data-original-title="#083139"></button><button type="button" class="note-color-btn" style="background-color:#003163;" data-event="backColor" data-value="#003163" title="" data-toggle="button" tabindex="-1" data-original-title="#003163"></button><button type="button" class="note-color-btn" style="background-color:#21104A;" data-event="backColor" data-value="#21104A" title="" data-toggle="button" tabindex="-1" data-original-title="#21104A"></button><button type="button" class="note-color-btn" style="background-color:#4A1031;" data-event="backColor" data-value="#4A1031" title="" data-toggle="button" tabindex="-1" data-original-title="#4A1031"></button></div></div></div><div class="btn-group"><div class="note-palette-title">Foreground Color</div><div class="note-color-reset" data-event="foreColor" data-value="inherit" title="Reset">Reset to default</div><div class="note-color-palette" data-target-event="foreColor"><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#000000;" data-event="foreColor" data-value="#000000" title="" data-toggle="button" tabindex="-1" data-original-title="#000000"></button><button type="button" class="note-color-btn" style="background-color:#424242;" data-event="foreColor" data-value="#424242" title="" data-toggle="button" tabindex="-1" data-original-title="#424242"></button><button type="button" class="note-color-btn" style="background-color:#636363;" data-event="foreColor" data-value="#636363" title="" data-toggle="button" tabindex="-1" data-original-title="#636363"></button><button type="button" class="note-color-btn" style="background-color:#9C9C94;" data-event="foreColor" data-value="#9C9C94" title="" data-toggle="button" tabindex="-1" data-original-title="#9C9C94"></button><button type="button" class="note-color-btn" style="background-color:#CEC6CE;" data-event="foreColor" data-value="#CEC6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#CEC6CE"></button><button type="button" class="note-color-btn" style="background-color:#EFEFEF;" data-event="foreColor" data-value="#EFEFEF" title="" data-toggle="button" tabindex="-1" data-original-title="#EFEFEF"></button><button type="button" class="note-color-btn" style="background-color:#F7F7F7;" data-event="foreColor" data-value="#F7F7F7" title="" data-toggle="button" tabindex="-1" data-original-title="#F7F7F7"></button><button type="button" class="note-color-btn" style="background-color:#FFFFFF;" data-event="foreColor" data-value="#FFFFFF" title="" data-toggle="button" tabindex="-1" data-original-title="#FFFFFF"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#FF0000;" data-event="foreColor" data-value="#FF0000" title="" data-toggle="button" tabindex="-1" data-original-title="#FF0000"></button><button type="button" class="note-color-btn" style="background-color:#FF9C00;" data-event="foreColor" data-value="#FF9C00" title="" data-toggle="button" tabindex="-1" data-original-title="#FF9C00"></button><button type="button" class="note-color-btn" style="background-color:#FFFF00;" data-event="foreColor" data-value="#FFFF00" title="" data-toggle="button" tabindex="-1" data-original-title="#FFFF00"></button><button type="button" class="note-color-btn" style="background-color:#00FF00;" data-event="foreColor" data-value="#00FF00" title="" data-toggle="button" tabindex="-1" data-original-title="#00FF00"></button><button type="button" class="note-color-btn" style="background-color:#00FFFF;" data-event="foreColor" data-value="#00FFFF" title="" data-toggle="button" tabindex="-1" data-original-title="#00FFFF"></button><button type="button" class="note-color-btn" style="background-color:#0000FF;" data-event="foreColor" data-value="#0000FF" title="" data-toggle="button" tabindex="-1" data-original-title="#0000FF"></button><button type="button" class="note-color-btn" style="background-color:#9C00FF;" data-event="foreColor" data-value="#9C00FF" title="" data-toggle="button" tabindex="-1" data-original-title="#9C00FF"></button><button type="button" class="note-color-btn" style="background-color:#FF00FF;" data-event="foreColor" data-value="#FF00FF" title="" data-toggle="button" tabindex="-1" data-original-title="#FF00FF"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#F7C6CE;" data-event="foreColor" data-value="#F7C6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#F7C6CE"></button><button type="button" class="note-color-btn" style="background-color:#FFE7CE;" data-event="foreColor" data-value="#FFE7CE" title="" data-toggle="button" tabindex="-1" data-original-title="#FFE7CE"></button><button type="button" class="note-color-btn" style="background-color:#FFEFC6;" data-event="foreColor" data-value="#FFEFC6" title="" data-toggle="button" tabindex="-1" data-original-title="#FFEFC6"></button><button type="button" class="note-color-btn" style="background-color:#D6EFD6;" data-event="foreColor" data-value="#D6EFD6" title="" data-toggle="button" tabindex="-1" data-original-title="#D6EFD6"></button><button type="button" class="note-color-btn" style="background-color:#CEDEE7;" data-event="foreColor" data-value="#CEDEE7" title="" data-toggle="button" tabindex="-1" data-original-title="#CEDEE7"></button><button type="button" class="note-color-btn" style="background-color:#CEE7F7;" data-event="foreColor" data-value="#CEE7F7" title="" data-toggle="button" tabindex="-1" data-original-title="#CEE7F7"></button><button type="button" class="note-color-btn" style="background-color:#D6D6E7;" data-event="foreColor" data-value="#D6D6E7" title="" data-toggle="button" tabindex="-1" data-original-title="#D6D6E7"></button><button type="button" class="note-color-btn" style="background-color:#E7D6DE;" data-event="foreColor" data-value="#E7D6DE" title="" data-toggle="button" tabindex="-1" data-original-title="#E7D6DE"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#E79C9C;" data-event="foreColor" data-value="#E79C9C" title="" data-toggle="button" tabindex="-1" data-original-title="#E79C9C"></button><button type="button" class="note-color-btn" style="background-color:#FFC69C;" data-event="foreColor" data-value="#FFC69C" title="" data-toggle="button" tabindex="-1" data-original-title="#FFC69C"></button><button type="button" class="note-color-btn" style="background-color:#FFE79C;" data-event="foreColor" data-value="#FFE79C" title="" data-toggle="button" tabindex="-1" data-original-title="#FFE79C"></button><button type="button" class="note-color-btn" style="background-color:#B5D6A5;" data-event="foreColor" data-value="#B5D6A5" title="" data-toggle="button" tabindex="-1" data-original-title="#B5D6A5"></button><button type="button" class="note-color-btn" style="background-color:#A5C6CE;" data-event="foreColor" data-value="#A5C6CE" title="" data-toggle="button" tabindex="-1" data-original-title="#A5C6CE"></button><button type="button" class="note-color-btn" style="background-color:#9CC6EF;" data-event="foreColor" data-value="#9CC6EF" title="" data-toggle="button" tabindex="-1" data-original-title="#9CC6EF"></button><button type="button" class="note-color-btn" style="background-color:#B5A5D6;" data-event="foreColor" data-value="#B5A5D6" title="" data-toggle="button" tabindex="-1" data-original-title="#B5A5D6"></button><button type="button" class="note-color-btn" style="background-color:#D6A5BD;" data-event="foreColor" data-value="#D6A5BD" title="" data-toggle="button" tabindex="-1" data-original-title="#D6A5BD"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#E76363;" data-event="foreColor" data-value="#E76363" title="" data-toggle="button" tabindex="-1" data-original-title="#E76363"></button><button type="button" class="note-color-btn" style="background-color:#F7AD6B;" data-event="foreColor" data-value="#F7AD6B" title="" data-toggle="button" tabindex="-1" data-original-title="#F7AD6B"></button><button type="button" class="note-color-btn" style="background-color:#FFD663;" data-event="foreColor" data-value="#FFD663" title="" data-toggle="button" tabindex="-1" data-original-title="#FFD663"></button><button type="button" class="note-color-btn" style="background-color:#94BD7B;" data-event="foreColor" data-value="#94BD7B" title="" data-toggle="button" tabindex="-1" data-original-title="#94BD7B"></button><button type="button" class="note-color-btn" style="background-color:#73A5AD;" data-event="foreColor" data-value="#73A5AD" title="" data-toggle="button" tabindex="-1" data-original-title="#73A5AD"></button><button type="button" class="note-color-btn" style="background-color:#6BADDE;" data-event="foreColor" data-value="#6BADDE" title="" data-toggle="button" tabindex="-1" data-original-title="#6BADDE"></button><button type="button" class="note-color-btn" style="background-color:#8C7BC6;" data-event="foreColor" data-value="#8C7BC6" title="" data-toggle="button" tabindex="-1" data-original-title="#8C7BC6"></button><button type="button" class="note-color-btn" style="background-color:#C67BA5;" data-event="foreColor" data-value="#C67BA5" title="" data-toggle="button" tabindex="-1" data-original-title="#C67BA5"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#CE0000;" data-event="foreColor" data-value="#CE0000" title="" data-toggle="button" tabindex="-1" data-original-title="#CE0000"></button><button type="button" class="note-color-btn" style="background-color:#E79439;" data-event="foreColor" data-value="#E79439" title="" data-toggle="button" tabindex="-1" data-original-title="#E79439"></button><button type="button" class="note-color-btn" style="background-color:#EFC631;" data-event="foreColor" data-value="#EFC631" title="" data-toggle="button" tabindex="-1" data-original-title="#EFC631"></button><button type="button" class="note-color-btn" style="background-color:#6BA54A;" data-event="foreColor" data-value="#6BA54A" title="" data-toggle="button" tabindex="-1" data-original-title="#6BA54A"></button><button type="button" class="note-color-btn" style="background-color:#4A7B8C;" data-event="foreColor" data-value="#4A7B8C" title="" data-toggle="button" tabindex="-1" data-original-title="#4A7B8C"></button><button type="button" class="note-color-btn" style="background-color:#3984C6;" data-event="foreColor" data-value="#3984C6" title="" data-toggle="button" tabindex="-1" data-original-title="#3984C6"></button><button type="button" class="note-color-btn" style="background-color:#634AA5;" data-event="foreColor" data-value="#634AA5" title="" data-toggle="button" tabindex="-1" data-original-title="#634AA5"></button><button type="button" class="note-color-btn" style="background-color:#A54A7B;" data-event="foreColor" data-value="#A54A7B" title="" data-toggle="button" tabindex="-1" data-original-title="#A54A7B"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#9C0000;" data-event="foreColor" data-value="#9C0000" title="" data-toggle="button" tabindex="-1" data-original-title="#9C0000"></button><button type="button" class="note-color-btn" style="background-color:#B56308;" data-event="foreColor" data-value="#B56308" title="" data-toggle="button" tabindex="-1" data-original-title="#B56308"></button><button type="button" class="note-color-btn" style="background-color:#BD9400;" data-event="foreColor" data-value="#BD9400" title="" data-toggle="button" tabindex="-1" data-original-title="#BD9400"></button><button type="button" class="note-color-btn" style="background-color:#397B21;" data-event="foreColor" data-value="#397B21" title="" data-toggle="button" tabindex="-1" data-original-title="#397B21"></button><button type="button" class="note-color-btn" style="background-color:#104A5A;" data-event="foreColor" data-value="#104A5A" title="" data-toggle="button" tabindex="-1" data-original-title="#104A5A"></button><button type="button" class="note-color-btn" style="background-color:#085294;" data-event="foreColor" data-value="#085294" title="" data-toggle="button" tabindex="-1" data-original-title="#085294"></button><button type="button" class="note-color-btn" style="background-color:#311873;" data-event="foreColor" data-value="#311873" title="" data-toggle="button" tabindex="-1" data-original-title="#311873"></button><button type="button" class="note-color-btn" style="background-color:#731842;" data-event="foreColor" data-value="#731842" title="" data-toggle="button" tabindex="-1" data-original-title="#731842"></button></div><div class="note-color-row"><button type="button" class="note-color-btn" style="background-color:#630000;" data-event="foreColor" data-value="#630000" title="" data-toggle="button" tabindex="-1" data-original-title="#630000"></button><button type="button" class="note-color-btn" style="background-color:#7B3900;" data-event="foreColor" data-value="#7B3900" title="" data-toggle="button" tabindex="-1" data-original-title="#7B3900"></button><button type="button" class="note-color-btn" style="background-color:#846300;" data-event="foreColor" data-value="#846300" title="" data-toggle="button" tabindex="-1" data-original-title="#846300"></button><button type="button" class="note-color-btn" style="background-color:#295218;" data-event="foreColor" data-value="#295218" title="" data-toggle="button" tabindex="-1" data-original-title="#295218"></button><button type="button" class="note-color-btn" style="background-color:#083139;" data-event="foreColor" data-value="#083139" title="" data-toggle="button" tabindex="-1" data-original-title="#083139"></button><button type="button" class="note-color-btn" style="background-color:#003163;" data-event="foreColor" data-value="#003163" title="" data-toggle="button" tabindex="-1" data-original-title="#003163"></button><button type="button" class="note-color-btn" style="background-color:#21104A;" data-event="foreColor" data-value="#21104A" title="" data-toggle="button" tabindex="-1" data-original-title="#21104A"></button><button type="button" class="note-color-btn" style="background-color:#4A1031;" data-event="foreColor" data-value="#4A1031" title="" data-toggle="button" tabindex="-1" data-original-title="#4A1031"></button></div></div></div></li></ul></div><div class="note-para btn-group"><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="insertUnorderedList" tabindex="-1" data-original-title="Unordered list (CTRL+SHIFT+NUM7)"><i class="fa fa-list-ul icon-list-ul"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="insertOrderedList" tabindex="-1" data-original-title="Ordered list (CTRL+SHIFT+NUM8)"><i class="fa fa-list-ol icon-list-ol"></i></button><button type="button" class="btn btn-default btn-sm btn-small dropdown-toggle" data-toggle="dropdown" title="" tabindex="-1" data-original-title="Paragraph"><i class="fa fa-align-left icon-align-left"></i> <span class="caret"></span></button><div class="dropdown-menu"><div class="note-align btn-group"><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="justifyLeft" tabindex="-1" data-original-title="Align left (CTRL+SHIFT+L)"><i class="fa fa-align-left icon-align-left"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="justifyCenter" tabindex="-1" data-original-title="Align center (CTRL+SHIFT+E)"><i class="fa fa-align-center icon-align-center"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="justifyRight" tabindex="-1" data-original-title="Align right (CTRL+SHIFT+R)"><i class="fa fa-align-right icon-align-right"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="justifyFull" tabindex="-1" data-original-title="Justify full (CTRL+SHIFT+J)"><i class="fa fa-align-justify icon-align-justify"></i></button></div><div class="note-list btn-group"><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="indent" tabindex="-1" data-original-title="Indent (CTRL+])"><i class="fa fa-indent icon-indent-right"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="outdent" tabindex="-1" data-original-title="Outdent (CTRL+[)"><i class="fa fa-outdent icon-indent-left"></i></button></div></div></div><div class="note-height btn-group"><button type="button" class="btn btn-default btn-sm btn-small dropdown-toggle" data-toggle="dropdown" title="" tabindex="-1" data-original-title="Line Height"><i class="fa fa-text-height icon-text-height"></i> <span class="caret"></span></button><ul class="dropdown-menu"><li><a data-event="lineHeight" href="#" data-value="1"><i class="fa fa-check icon-ok"></i> 1.0</a></li><li><a data-event="lineHeight" href="#" data-value="1.2"><i class="fa fa-check icon-ok"></i> 1.2</a></li><li><a data-event="lineHeight" href="#" data-value="1.4"><i class="fa fa-check icon-ok"></i> 1.4</a></li><li><a data-event="lineHeight" href="#" data-value="1.5"><i class="fa fa-check icon-ok"></i> 1.5</a></li><li><a data-event="lineHeight" href="#" data-value="1.6"><i class="fa fa-check icon-ok"></i> 1.6</a></li><li><a data-event="lineHeight" href="#" data-value="1.8"><i class="fa fa-check icon-ok"></i> 1.8</a></li><li><a data-event="lineHeight" href="#" data-value="2"><i class="fa fa-check icon-ok"></i> 2.0</a></li><li><a data-event="lineHeight" href="#" data-value="3"><i class="fa fa-check icon-ok"></i> 3.0</a></li></ul></div><div class="note-table btn-group"><button type="button" class="btn btn-default btn-sm btn-small dropdown-toggle" data-toggle="dropdown" title="" tabindex="-1" data-original-title="Table"><i class="fa fa-table icon-table"></i> <span class="caret"></span></button><ul class="dropdown-menu"><div class="note-dimension-picker"><div class="note-dimension-picker-mousecatcher" data-event="insertTable" data-value="1x1" style="width: 10em; height: 10em;"></div><div class="note-dimension-picker-highlighted"></div><div class="note-dimension-picker-unhighlighted"></div></div><div class="note-dimension-display"> 1 x 1 </div></ul></div><div class="note-insert btn-group"><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="showLinkDialog" tabindex="-1" data-original-title="Link (CTRL+K)"><i class="fa fa-link icon-link"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" tabindex="-1" data-original-title="Picture" data-toggle="image"><i class="fa fa-picture-o icon-picture"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="showVideoDialog" tabindex="-1" data-original-title="Video"><i class="fa fa-youtube-play icon-play"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="insertHorizontalRule" tabindex="-1" data-original-title="Insert Horizontal Rule (CTRL+ENTER)"><i class="fa fa-minus icon-hr"></i></button></div><div class="note-view btn-group"><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="fullscreen" tabindex="-1" data-original-title="Full Screen"><i class="fa fa-arrows-alt icon-fullscreen"></i></button><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="codeview" tabindex="-1" data-original-title="Code View"><i class="fa fa-code icon-code"></i></button></div><div class="note-help btn-group"><button type="button" class="btn btn-default btn-sm btn-small" title="" data-event="showHelpDialog" tabindex="-1" data-original-title="Help"><i class="fa fa-question icon-question"></i></button></div></div><textarea class="note-codable"></textarea><div class="note-editable" contenteditable="true" style="height: 300px;"><p><br></p></div><div class="note-statusbar"><div class="note-resizebar"><div class="note-icon-bar"></div><div class="note-icon-bar"></div><div class="note-icon-bar"></div></div></div></div>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-meta-title1">Meta Tag Title</label>
                    <div class="col-sm-7">
                      <input type="text" name="product_description[1][meta_title]" value="" placeholder="Meta Tag Title" id="input-meta-title1" class="form-control">
                                          </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description1">Meta Tag Description</label>
                    <div class="col-sm-7">
                      <textarea name="product_description[1][meta_description]" rows="5" placeholder="Meta Tag Description" id="input-meta-description1" class="form-control"></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-keyword1">Meta Tag Keywords</label>
                    <div class="col-sm-7">
                      <textarea name="product_description[1][meta_keyword]" rows="5" placeholder="Meta Tag Keywords" id="input-meta-keyword1" class="form-control"></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-tag1"><span data-toggle="tooltip" title="" data-original-title="comma separated">Product Tags</span></label>
                    <div class="col-sm-7">
                      <input type="text" name="product_description[1][tag]" value="" placeholder="Product Tags" id="input-tag1" class="form-control">
                    </div>
                  </div>
                </div>
                              </div>
            </div>
            <div class="tab-pane" id="tabM-data">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-image">Image</label>
                <div class="col-sm-7">
                  <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="http://127.0.0.1/oc2101/image/cache/no_image-100x100.png" alt="" title="" data-placeholder="http://127.0.0.1/oc2101/image/cache/no_image-100x100.png"></a>
                  <input type="hidden" name="image" value="" id="input-image">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_image" value="1" <?php if($config_multiseller_image==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_image" value="0" <?php if($config_multiseller_image==0 || !$config_multiseller_image){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-model">Model</label>
                <div class="col-sm-7">
                  <input type="text" name="model" value="" placeholder="Model" id="input-model" class="form-control">
                  </div>
                  <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_model" value="1" <?php if($config_multiseller_model==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_model" value="0" <?php if($config_multiseller_model==0 || !$config_multiseller_model){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sku"><span data-toggle="tooltip" title="" data-original-title="Stock Keeping Unit">SKU</span></label>
                <div class="col-sm-7">
                  <input type="text" name="sku" value="" placeholder="SKU" id="input-sku" class="form-control">
                </div>
                 <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_sku" value="1" <?php if($config_multiseller_sku==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_sku" value="0" <?php if($config_multiseller_sku==0 || !$config_multiseller_sku){echo $chk;}?> /> <?php echo $text_no; ?></label></div>                
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-upc"><span data-toggle="tooltip" title="" data-original-title="Universal Product Code">UPC</span></label>
                <div class="col-sm-7">
                  <input type="text" name="upc" value="" placeholder="UPC" id="input-upc" class="form-control">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_upc" value="1" <?php if($config_multiseller_upc==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_upc" value="0" <?php if($config_multiseller_upc==0 || !$config_multiseller_upc){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ean"><span data-toggle="tooltip" title="" data-original-title="European Article Number">EAN</span></label>
                <div class="col-sm-7">
                  <input type="text" name="ean" value="" placeholder="EAN" id="input-ean" class="form-control">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_ean" value="1" <?php if($config_multiseller_ean==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_ean" value="0" <?php if($config_multiseller_ean==0 || !$config_multiseller_ean){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-jan"><span data-toggle="tooltip" title="" data-original-title="Japanese Article Number">JAN</span></label>
                <div class="col-sm-7">
                  <input type="text" name="jan" value="" placeholder="JAN" id="input-jan" class="form-control">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_jan" value="1" <?php if($config_multiseller_jan==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_jan" value="0" <?php if($config_multiseller_jan==0 || !$config_multiseller_jan){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-isbn"><span data-toggle="tooltip" title="" data-original-title="International Standard Book Number">ISBN</span></label>
                <div class="col-sm-7">
                  <input type="text" name="isbn" value="" placeholder="ISBN" id="input-isbn" class="form-control">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_isbn" value="1" <?php if($config_multiseller_isbn==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_isbn" value="0" <?php if($config_multiseller_isbn==0 || !$config_multiseller_isbn){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mpn"><span data-toggle="tooltip" title="" data-original-title="Manufacturer Part Number">MPN</span></label>
                <div class="col-sm-7">
                  <input type="text" name="mpn" value="" placeholder="MPN" id="input-mpn" class="form-control">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_mpn" value="1" <?php if($config_multiseller_mpn==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_mpn" value="0" <?php if($config_multiseller_mpn==0 || !$config_multiseller_mpn){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-location">Location</label>
                <div class="col-sm-7">
                  <input type="text" name="location" value="" placeholder="Location" id="input-location" class="form-control">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_location" value="1" <?php if($config_multiseller_location==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_location" value="0" <?php if($config_multiseller_location==0 || !$config_multiseller_location){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-price">Price</label>
                <div class="col-sm-7">
                  <input type="text" name="price" value="" placeholder="Price" id="input-price" class="form-control">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_price" value="1" <?php if($config_multiseller_price==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_price" value="0" <?php if($config_multiseller_price==0 || !$config_multiseller_price){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-tax-class">Tax Class</label>
                <div class="col-sm-7">
                  <select name="tax_class_id" id="input-tax-class" class="form-control">
                    <option value="0"> --- None --- </option>
                                                            <option value="9">Taxable Goods</option>
                                                                                <option value="10">Downloadable Products</option>
                                                          </select>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_tax_class" value="1" <?php if($config_multiseller_tax_class==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_tax_class" value="0" <?php if($config_multiseller_tax_class==0 || !$config_multiseller_tax_class){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-quantity">Quantity</label>
                <div class="col-sm-7">
                  <input type="text" name="quantity" value="1" placeholder="Quantity" id="input-quantity" class="form-control">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_quantity" value="1" <?php if($config_multiseller_quantity==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_quantity" value="0" <?php if($config_multiseller_quantity==0 || !$config_multiseller_quantity){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-minimum"><span data-toggle="tooltip" title="" data-original-title="Force a minimum ordered amount">Minimum Quantity</span></label>
                <div class="col-sm-7">
                  <input type="text" name="minimum" value="1" placeholder="Minimum Quantity" id="input-minimum" class="form-control">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_minimum_quantity" value="1" <?php if($config_multiseller_minimum_quantity==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_minimum_quantity" value="0" <?php if($config_multiseller_minimum_quantity==0 || !$config_multiseller_minimum_quantity){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-subtract">Subtract Stock</label>
                <div class="col-sm-7">
                  <select name="subtract" id="input-subtract" class="form-control">
                                        <option value="1" selected="selected">Yes</option>
                    <option value="0">No</option>
                                      </select>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_subtract_stok" value="1" <?php if($config_multiseller_subtract_stok==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_subtract_stok" value="0" <?php if($config_multiseller_subtract_stok==0 || !$config_multiseller_subtract_stok){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-stock-status"><span data-toggle="tooltip" title="" data-original-title="Status shown when a product is out of stock">Out Of Stock Status</span></label>
                <div class="col-sm-7">
                  <select name="stock_status_id" id="input-stock-status" class="form-control">
                                                            <option value="6">2-3 Days</option>
                                                                                <option value="7">In Stock</option>
                                                                                <option value="5">Out Of Stock</option>
                                                                                <option value="8">Pre-Order</option>
                                                          </select>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_out_of_stock_status" value="1" <?php if($config_multiseller_out_of_stock_status==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_out_of_stock_status" value="0" <?php if($config_multiseller_out_of_stock_status==0 || !$config_multiseller_out_of_stock_status){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Requires Shipping</label>
                <div class="col-sm-7">
                  <label class="radio-inline">
                                        <input type="radio" name="shipping" value="1" checked="checked">
                    Yes                                      </label>
                  <label class="radio-inline">
                                        <input type="radio" name="shipping" value="0">
                    No                                      </label>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_requires_shipping" value="1" <?php if($config_multiseller_requires_shipping==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_requires_shipping" value="0" <?php if($config_multiseller_requires_shipping==0 || !$config_multiseller_requires_shipping){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="" data-original-title="Do not use spaces, instead replace spaces with - and make sure the SEO URL is globally unique.">SEO URL</span></label>
                <div class="col-sm-7">
                  <input type="text" name="keyword" value="" placeholder="SEO URL" id="input-keyword" class="form-control">
                                  </div>
                                  <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_seo_url" value="1" <?php if($config_multiseller_seo_url==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_seo_url" value="0" <?php if($config_multiseller_seo_url==0 || !$config_multiseller_seo_url){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-date-available">Date Available</label>
                <div class="col-sm-3">
                  <div class="input-group date">
                    <input type="text" name="date_available" value="2016-02-13" placeholder="Date Available" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control">
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
                <div class="col-sm-4"></div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_date_available" value="1" <?php if($config_multiseller_date_available==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_date_available" value="0" <?php if($config_multiseller_date_available==0 || !$config_multiseller_date_available){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length">Dimensions (L x W x H)</label>
                <div class="col-sm-7">
                  <div class="row">
                    <div class="col-sm-4">
                      <input type="text" name="length" value="" placeholder="Length" id="input-length" class="form-control">
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="width" value="" placeholder="Width" id="input-width" class="form-control">
                    </div>
                    <div class="col-sm-4">
                      <input type="text" name="height" value="" placeholder="Height" id="input-height" class="form-control">
                    </div>
                  </div>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_dimensions" value="1" <?php if($config_multiseller_dimensions==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_dimensions" value="0" <?php if($config_multiseller_dimensions==0 || !$config_multiseller_dimensions){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length-class">Length Class</label>
                <div class="col-sm-7">
                  <select name="length_class_id" id="input-length-class" class="form-control">
                                                            <option value="1" selected="selected">Centimeter</option>
                                                                                <option value="2">Millimeter</option>
                                                                                <option value="3">Inch</option>
                                                          </select>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_length_class" value="1" <?php if($config_multiseller_length_class==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_length_class" value="0" <?php if($config_multiseller_length_class==0 || !$config_multiseller_length_class){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight">Weight</label>
                <div class="col-sm-7">
                  <input type="text" name="weight" value="" placeholder="Weight" id="input-weight" class="form-control">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_weight" value="1" <?php if($config_multiseller_weight==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_weight" value="0" <?php if($config_multiseller_weight==0 || !$config_multiseller_weight){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight-class">Weight Class</label>
                <div class="col-sm-7">
                  <select name="weight_class_id" id="input-weight-class" class="form-control">
                                                            <option value="1" selected="selected">Kilogram</option>
                                                                                <option value="2">Gram</option>
                                                                                <option value="5">Pound </option>
                                                                                <option value="6">Ounce</option>
                                                          </select>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_weight_class" value="1" <?php if($config_multiseller_weight_class==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_weight_class" value="0" <?php if($config_multiseller_weight_class==0 || !$config_multiseller_weight_class){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status">Status</label>
                <div class="col-sm-7">
                  <select name="status" id="input-status" class="form-control">
                                        <option value="1" selected="selected">Enabled</option>
                    <option value="0">Disabled</option>
                                      </select>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_status" value="1" <?php if($config_multiseller_status==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_status" value="0" <?php if($config_multiseller_status==0 || !$config_multiseller_status){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order">Sort Order</label>
                <div class="col-sm-7">
                  <input type="text" name="sort_order" value="1" placeholder="Sort Order" id="input-sort-order" class="form-control">
                </div>
              <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_sort_order" value="1" <?php if($config_multiseller_sort_order==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_sort_order" value="0" <?php if($config_multiseller_sort_order==0 || !$config_multiseller_sort_order){echo $chk;}?> /> <?php echo $text_no; ?></label></div> 
               </div>
            </div>
            <div class="tab-pane" id="tabM-links">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-manufacturer"><span data-toggle="tooltip" title="" data-original-title="(Autocomplete)">Manufacturer</span></label>
                <div class="col-sm-7">
                  <input type="text" name="manufacturer" value="" placeholder="Manufacturer" id="input-manufacturer" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                  <input type="hidden" name="manufacturer_id" value="0">
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_manufacturer" value="1" <?php if($config_multiseller_manufacturer==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_manufacturer" value="0" <?php if($config_multiseller_manufacturer==0 || !$config_multiseller_manufacturer){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="" data-original-title="(Autocomplete)">Categories</span></label>
                <div class="col-sm-7">
                  <input type="text" name="category" value="" placeholder="Categories" id="input-category" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                  <div id="product-category" class="well well-sm" style="height: 150px; overflow: auto;">
                                      </div>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_categories" value="1" <?php if($config_multiseller_categories==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_categories" value="0" <?php if($config_multiseller_categories==0 || !$config_multiseller_categories){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="" data-original-title="(Autocomplete)">Filters</span></label>
                <div class="col-sm-7">
                  <input type="text" name="filter" value="" placeholder="Filters" id="input-filter" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                  <div id="product-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                                      </div>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_filters" value="1" <?php if($config_multiseller_filters==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_filters" value="0" <?php if($config_multiseller_filters==0 || !$config_multiseller_filters){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Stores</label>
                <div class="col-sm-7">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                      <label>
                                                <input type="checkbox" name="product_store[]" value="0" checked="checked">
                        Default                                              </label>
                    </div>
                                      </div>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_stors" value="1" <?php if($config_multiseller_stors==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_stors" value="0" <?php if($config_multiseller_stors==0 || !$config_multiseller_stors){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-download"><span data-toggle="tooltip" title="" data-original-title="(Autocomplete)">Downloads</span></label>
                <div class="col-sm-7">
                  <input type="text" name="download" value="" placeholder="Downloads" id="input-download" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                  <div id="product-download" class="well well-sm" style="height: 150px; overflow: auto;">
                                      </div>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_downloads" value="1" <?php if($config_multiseller_downloads==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_downloads" value="0" <?php if($config_multiseller_downloads==0 || !$config_multiseller_downloads){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="" data-original-title="(Autocomplete)">Related Products</span></label>
                <div class="col-sm-7">
                  <input type="text" name="related" value="" placeholder="Related Products" id="input-related" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                  <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
                                      </div>
                </div>
                <div class="col-sm-3"><label class="radio-inline"><input type="radio" name="config_multiseller_related_products" value="1" <?php if($config_multiseller_related_products==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_multiseller_related_products" value="0" <?php if($config_multiseller_related_products==0 || !$config_multiseller_related_products){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
              </div>
            </div>
            <div class="tab-pane" id="tabM-attribute">
              <div class="table-responsive">
                <table id="attribute" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">Attribute</td>
                      <td class="text-left">Text</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                                                          </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addAttribute();" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add Attribute"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tabM-option">
              <div class="row">
                <div class="col-sm-2">
                  <ul class="nav nav-pills nav-stacked" id="option">
                                                            <li>
                      <input type="text" name="option" value="" placeholder="Option" id="input-option" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                    </li>
                  </ul>
                </div>
                <div class="col-sm-7">
                  <div class="tab-content">
                                                                              </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tabM-recurring">
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">Recurring Profile</td>
                      <td class="text-left">Customer Group</td>
                      <td class="text-left"></td>
                    </tr>
                  </thead>
                  <tbody>
                                                          </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addRecurring()" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add Recurring"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tabM-discount">
              <div class="table-responsive">
                <table id="discount" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">Customer Group</td>
                      <td class="text-right">Quantity</td>
                      <td class="text-right">Priority</td>
                      <td class="text-right">Price</td>
                      <td class="text-left">Date Start</td>
                      <td class="text-left">Date End</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                                                          </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="6"></td>
                      <td class="text-left"><button type="button" onclick="addDiscount();" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add Discount"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tabM-special">
              <div class="table-responsive">
                <table id="special" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">Customer Group</td>
                      <td class="text-right">Priority</td>
                      <td class="text-right">Price</td>
                      <td class="text-left">Date Start</td>
                      <td class="text-left">Date End</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                                                          </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="5"></td>
                      <td class="text-left"><button type="button" onclick="addSpecial();" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add Special"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tabM-image">
              <div class="table-responsive">
                <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">Image</td>
                      <td class="text-right">Sort Order</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                                                          </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"></td>
                      <td class="text-left"><button type="button" onclick="addImage();" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Add Image"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tabM-reward">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-points"><span data-toggle="tooltip" title="" data-original-title="Number of points needed to buy this item. If you don't want this product to be purchased with points leave as 0.">Points</span></label>
                <div class="col-sm-7">
                  <input type="text" name="points" value="" placeholder="Points" id="input-points" class="form-control">
                </div>
              </div>
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">Customer Group</td>
                      <td class="text-right">Reward Points</td>
                    </tr>
                  </thead>
                  <tbody>
                                        <tr>
                      <td class="text-left">Default</td>
                      <td class="text-right"><input type="text" name="product_reward[1][points]" value="" class="form-control"></td>
                    </tr>
                                      </tbody>
                </table>
              </div>
            </div>
            <div class="tab-pane" id="tabM-design">
              <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left">Stores</td>
                      <td class="text-left">Layout Override</td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="text-left">Default</td>
                      <td class="text-left"><select name="product_layout[0]" class="form-control">
                          <option value=""></option>
                                                                              <option value="6">Account</option>
                                                                                                        <option value="10">Affiliate</option>
                                                                                                        <option value="3">Category</option>
                                                                                                        <option value="7">Checkout</option>
                                                                                                        <option value="12">Compare</option>
                                                                                                        <option value="8">Contact</option>
                                                                                                        <option value="4">Default</option>
                                                                                                        <option value="1">Home</option>
                                                                                                        <option value="11">Information</option>
                                                                                                        <option value="5">Manufacturer</option>
                                                                                                        <option value="2">Product</option>
                                                                                                        <option value="13">Search</option>
                                                                                                        <option value="9">Sitemap</option>
                                                                            </select></td>
                    </tr>
                                      </tbody>
                </table>
              </div>
            </div>
          </div>


</div> <!-- // tab-multisellerproductsetting end // -->
					</div> <!-- // tab-content end // -->
</div>
            <div class="tab-pane" id="tab-server">
              <fieldset>
                <legend><?php echo $text_general; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_maintenance; ?>"><?php echo $entry_maintenance; ?></span></label>
                    <div class="col-sm-10">
                      <label class="radio-inline">
                        <?php if ($config_maintenance) { ?>
                        <input type="radio" name="config_maintenance" value="1" checked="checked" />
                        <?php echo $text_yes; ?>
                        <?php } else { ?>
                        <input type="radio" name="config_maintenance" value="1" />
                        <?php echo $text_yes; ?>
                        <?php } ?>
                      </label>
                      <label class="radio-inline">
                        <?php if (!$config_maintenance) { ?>
                        <input type="radio" name="config_maintenance" value="0" checked="checked" />
                        <?php echo $text_no; ?>
                        <?php } else { ?>
                        <input type="radio" name="config_maintenance" value="0" />
                        <?php echo $text_no; ?>
                        <?php } ?>
                      </label>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_seo_url; ?>"><?php echo $entry_seo_url; ?></span></label>
                   <div class="col-sm-10">
                     <label class="radio-inline">
                       <?php if ($config_seo_url) { ?>
                       <input type="radio" name="config_seo_url" value="1" checked="checked" />
                       <?php echo $text_yes; ?>
                       <?php } else { ?>
                       <input type="radio" name="config_seo_url" value="1" />
                       <?php echo $text_yes; ?>
                       <?php } ?>
                     </label>
                     <label class="radio-inline">
                       <?php if (!$config_seo_url) { ?>
                       <input type="radio" name="config_seo_url" value="0" checked="checked" />
                       <?php echo $text_no; ?>
                       <?php } else { ?>
                       <input type="radio" name="config_seo_url" value="0" />
                       <?php echo $text_no; ?>
                       <?php } ?>
                     </label>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="col-sm-2 control-label" for="input-robots"><span data-toggle="tooltip" title="<?php echo $help_robots; ?>"><?php echo $entry_robots; ?></span></label>
                   <div class="col-sm-10">
                     <textarea name="config_robots" rows="5" placeholder="<?php echo $entry_robots; ?>" id="input-robots" class="form-control"><?php echo $config_robots; ?></textarea>
                   </div>
                 </div>
                 <div class="form-group">
                   <label class="col-sm-2 control-label" for="input-compression"><span data-toggle="tooltip" title="<?php echo $help_compression; ?>"><?php echo $entry_compression; ?></span></label>
                   <div class="col-sm-10">
                     <input type="text" name="config_compression" value="<?php echo $config_compression; ?>" placeholder="<?php echo $entry_compression; ?>" id="input-compression" class="form-control" />
                   </div>
                </div>
            </fieldset>
            <fieldset>
              <legend><?php echo $text_security; ?></legend>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_secure; ?>"><?php echo $entry_secure; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_secure) { ?>
                    <input type="radio" name="config_secure" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_secure" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_secure) { ?>
                    <input type="radio" name="config_secure" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_secure" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_password; ?>"><?php echo $entry_password; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_password) { ?>
                    <input type="radio" name="config_password" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_password" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_password) { ?>
                    <input type="radio" name="config_password" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_password" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_shared; ?>"><?php echo $entry_shared; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_shared) { ?>
                    <input type="radio" name="config_shared" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_shared" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_shared) { ?>
                    <input type="radio" name="config_shared" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_shared" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-encryption"><span data-toggle="tooltip" title="<?php echo $help_encryption; ?>"><?php echo $entry_encryption; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="config_encryption" rows="5" placeholder="<?php echo $entry_encryption; ?>" id="input-encryption" class="form-control"><?php echo $config_encryption; ?></textarea>
                  <?php if ($error_encryption) { ?>
                  <div class="text-danger"><?php echo $error_encryption; ?></div>
                  <?php } ?>
                </div>
              </div>
            </fieldset>
            <fieldset>
              <legend><?php echo $text_upload; ?></legend>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-file-max-size"><span data-toggle="tooltip" title="<?php echo $help_file_max_size; ?>"><?php echo $entry_file_max_size; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_file_max_size" value="<?php echo $config_file_max_size; ?>" placeholder="<?php echo $entry_file_max_size; ?>" id="input-file-max-size" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-file-ext-allowed"><span data-toggle="tooltip" title="<?php echo $help_file_ext_allowed; ?>"><?php echo $entry_file_ext_allowed; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="config_file_ext_allowed" rows="5" placeholder="<?php echo $entry_file_ext_allowed; ?>" id="input-file-ext-allowed" class="form-control"><?php echo $config_file_ext_allowed; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-file-mime-allowed"><span data-toggle="tooltip" title="<?php echo $help_file_mime_allowed; ?>"><?php echo $entry_file_mime_allowed; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="config_file_mime_allowed" rows="5" placeholder="<?php echo $entry_file_mime_allowed; ?>" id="input-file-mime-allowed" class="form-control"><?php echo $config_file_mime_allowed; ?></textarea>
                </div>
              </div>
            </fieldset>
            <fieldset>
              <legend><?php echo $text_error; ?></legend>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_error_display; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_error_display) { ?>
                    <input type="radio" name="config_error_display" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_error_display" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_error_display) { ?>
                    <input type="radio" name="config_error_display" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_error_display" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_error_log; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_error_log) { ?>
                    <input type="radio" name="config_error_log" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_error_log" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_error_log) { ?>
                    <input type="radio" name="config_error_log" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_error_log" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-error-filename"><?php echo $entry_error_filename; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_error_filename" value="<?php echo $config_error_filename; ?>" placeholder="<?php echo $entry_error_filename; ?>" id="input-error-filename" class="form-control" />
                  <?php if ($error_error_filename) { ?>
                  <div class="text-danger"><?php echo $error_error_filename; ?></div>
                  <?php } ?>
                </div>
              </div>
              </fieldset>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('select[name=\'config_template\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=setting/setting/template&token=<?php echo $token; ?>&template=' + encodeURIComponent(this.value),
		dataType: 'html',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(html) {
			$('#template').attr('src', html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'config_template\']').trigger('change');
//--></script>
  <script type="text/javascript"><!--
$('select[name=\'config_country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'config_country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
          			html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $config_zone_id; ?>') {
            			html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'config_zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'config_country_id\']').trigger('change');
//--></script></div>
<?php echo $footer; ?>
