<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
		  	  <?php if (!$beneficiary_approved) { ; ?>
                    <a href="<?php echo $approve; ?>" data-toggle="tooltip" title="<?php echo $button_approve; ?>" class="btn btn-success"><i class="fa fa-thumbs-o-up"></i></a>
                    <?php } else { ?>
                    <button type="button" class="btn btn-success" disabled><i class="fa fa-thumbs-o-up"></i></button>
                    <?php } ?>
                    <?php if ($beneficiary_approved) { ; ?>
                    <a href="<?php echo $disapprove; ?>" data-toggle="tooltip" title="<?php echo $button_disapprove; ?>" class="btn btn-danger"><i class="fa fa-thumbs-o-down"></i></a>
                    <?php } else { ?>
                    <button type="button" class="btn btn-danger" disabled><i class="fa fa-thumbs-o-down"></i></button>
                    <?php } ?>
        <button type="submit" form="form-beneficiary" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-beneficiary" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-more_details" data-toggle="tab"><?php echo $tab_more_details; ?></a></li>
            <?php if ($beneficiary_id) { ?>
			<li><a href="#tab-categories" data-toggle="tab"><?php echo $tab_categories; ?></a></li>
			<li><a href="#tab-badge" data-toggle="tab"><?php echo $tab_badge; ?></a></li>
			<li><a href="#tab-beneficiaryproduct" data-toggle="tab"><?php echo $tab_beneficiaryproduct; ?></a></li>
            <li><a href="#tab-history" data-toggle="tab"><?php echo $tab_history; ?></a></li>
            <li><a href="#tab-transaction" data-toggle="tab"><?php echo $tab_transaction; ?></a></li>
            <li><a href="#tab-reward" data-toggle="tab"><?php echo $tab_reward; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="row">
	             <div class="col-sm-2">
                  <ul class="nav nav-pills nav-stacked" id="bankaccount">
                    <li class="active"><a href="#tab-beneficiary" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                    <?php $bankaccount_row = 1; ?>
                    <?php foreach ($bankaccounts as $bankaccount) { ?>
                    <li><a href="#tab-bankaccount<?php echo $bankaccount_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('#bankaccount a:first').tab('show'); $('#bankaccount a[href=\'#tab-bankaccount<?php echo $bankaccount_row; ?>\']').parent().remove(); $('#tab-bankaccount<?php echo $bankaccount_row; ?>').remove();"></i> <?php echo $tab_bankaccount . ' ' . $bankaccount_row; ?></a></li>
                    <?php $bankaccount_row++; ?>
                    <?php } ?>
                    <li id="bankaccount-add"><a onclick="addbankaccount();"><i class="fa fa-plus-circle"></i> <?php echo $button_bankaccount_add; ?></a></li>
                  </ul>
                </div>
                <div class="col-sm-10">
                  <div class="tab-content">
                    <div class="tab-pane active" id="tab-beneficiary">
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-beneficiary-group"><?php echo $entry_beneficiary_group; ?></label>
                        <div class="col-sm-10">
                          <select name="beneficiary_group_id" id="input-beneficiary-group" class="form-control">
                            <?php foreach ($beneficiary_groups as $beneficiary_group) { ?>
                            <?php if ($beneficiary_group['beneficiary_group_id'] == $beneficiary_group_id) { ?>
                            <option value="<?php echo $beneficiary_group['beneficiary_group_id']; ?>" selected="selected"><?php echo $beneficiary_group['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $beneficiary_group['beneficiary_group_id']; ?>"><?php echo $beneficiary_group['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                          <?php if ($error_firstname) { ?>
                          <div class="text-danger"><?php echo $error_firstname; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                          <?php if ($error_lastname) { ?>
                          <div class="text-danger"><?php echo $error_lastname; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                          <?php if ($error_email) { ?>
                          <div class="text-danger"><?php echo $error_email; ?></div>
                          <?php  } ?>
                        </div>
                      </div>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                          <?php if ($error_telephone) { ?>
                          <div class="text-danger"><?php echo $error_telephone; ?></div>
                          <?php  } ?>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
                        </div>
                      </div>
                      <?php foreach ($custom_fields as $custom_field) { ?>
                      <?php if ($custom_field['location'] == 'account') { ?>
                      <?php if ($custom_field['type'] == 'select') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                            <option value=""><?php echo $text_select; ?></option>
                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                            <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                          </select>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'radio') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
                        <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <div>
                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <div class="radio">
                              <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                              <label>
                                <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                <?php echo $custom_field_value['name']; ?></label>
                              <?php } else { ?>
                              <label>
                                <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                <?php echo $custom_field_value['name']; ?></label>
                              <?php } ?>
                            </div>
                            <?php } ?>
                          </div>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'checkbox') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
                        <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <div>
                            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <div class="checkbox">
                              <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                              <label>
                                <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                <?php echo $custom_field_value['name']; ?></label>
                              <?php } else { ?>
                              <label>
                                <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                <?php echo $custom_field_value['name']; ?></label>
                              <?php } ?>
                            </div>
                            <?php } ?>
                          </div>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'text') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'textarea') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'file') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
                        <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                          <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'date') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group date">
                            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'time') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group time">
                            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php if ($custom_field['type'] == 'datetime') { ?>
                      <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
                        <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                        <div class="col-sm-10">
                          <div class="input-group datetime">
                            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                            <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <?php } ?>
                      <?php } ?>
                      <?php } ?>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                        <div class="col-sm-10">
                          <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" autocomplete="off" />
                          <?php if ($error_password) { ?>
                          <div class="text-danger"><?php echo $error_password; ?></div>
                          <?php  } ?>
                        </div>
                      </div>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                        <div class="col-sm-10">
                          <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" autocomplete="off" id="input-confirm" class="form-control" />
                          <?php if ($error_confirm) { ?>
                          <div class="text-danger"><?php echo $error_confirm; ?></div>
                          <?php  } ?>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-newsletter"><?php echo $entry_newsletter; ?></label>
                        <div class="col-sm-10">
                          <select name="newsletter" id="input-newsletter" class="form-control">
                            <?php if ($newsletter) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                          <select name="status" id="input-status" class="form-control">
                            <?php if ($status) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-safe"><?php echo $entry_safe; ?></label>
                        <div class="col-sm-10">
                          <select name="safe" id="input-safe" class="form-control">
                            <?php if ($status) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                            <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                    </div>
                    <?php $bankaccount_row = 1; ?>
                    <?php foreach ($bankaccounts as $bankaccount) { ?>
                    <div class="tab-pane" id="tab-bankaccount<?php echo $bankaccount_row; ?>">
                      <input type="hidden" name="bankaccount[<?php echo $bankaccount_row; ?>][bankaccount_id]" value="<?php echo $bankaccount['bankaccount_id']; ?>" />
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-firstname<?php echo $bankaccount_row; ?>"><?php echo $entry_firstname; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="bankaccount[<?php echo $bankaccount_row; ?>][firstname]" value="<?php echo $bankaccount['firstname']; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname<?php echo $bankaccount_row; ?>" class="form-control" />
                          <?php if (isset($error_bankaccount[$bankaccount_row]['firstname'])) { ?>
                          <div class="text-danger"><?php echo $error_bankaccount[$bankaccount_row]['firstname']; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-lastname<?php echo $bankaccount_row; ?>"><?php echo $entry_lastname; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="bankaccount[<?php echo $bankaccount_row; ?>][lastname]" value="<?php echo $bankaccount['lastname']; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname<?php echo $bankaccount_row; ?>" class="form-control" />
                          <?php if (isset($error_bankaccount[$bankaccount_row]['lastname'])) { ?>
                          <div class="text-danger"><?php echo $error_bankaccount[$bankaccount_row]['lastname']; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                         <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-bank<?php echo $bankaccount_row; ?>"><?php echo $entry_bank; ?></label>
                        <div class="col-sm-10">
                          <select name="bankaccount[<?php echo $bankaccount_row; ?>][bank_id]" id="input-bank<?php echo $bankaccount_row; ?>" class="form-control">
                            <option value=""><?php echo $text_select; ?></option>
                            <?php foreach ($banks as $bank) { ?>
                            <?php if ($bank['bank_id'] == $bankaccount['bank_id']) { ?>
                            <option value="<?php echo $bank['bank_id']; ?>" selected="selected"><?php echo $bank['title']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $bank['bank_id']; ?>"><?php echo $bank['title']; ?></option>
                            <?php } ?>
                            <?php } ?>
                          </select>
                          <?php if (isset($error_bankaccount[$bankaccount_row]['bank'])) { ?>
                          <div class="text-danger"><?php echo $error_bankaccount[$bankaccount_row]['bank']; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                       <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-branch_id<?php echo $bankaccount_row; ?>"><?php echo $entry_branch_id; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="bankaccount[<?php echo $bankaccount_row; ?>][branch_id]" value="<?php echo $bankaccount['branch_id']; ?>" placeholder="<?php echo $entry_branch_id; ?>" id="input-branch_id<?php echo $bankaccount_row; ?>" class="form-control" />
                          <?php if (isset($error_bankaccount[$bankaccount_row]['branch_id'])) { ?>
                          <div class="text-danger"><?php echo $error_bankaccount[$bankaccount_row]['branch_id']; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-company_id<?php echo $bankaccount_row; ?>"><?php echo $entry_company_id; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="bankaccount[<?php echo $bankaccount_row; ?>][company_id]" value="<?php echo $bankaccount['company_id']; ?>" placeholder="<?php echo $entry_company_id; ?>" id="input-company_id<?php echo $bankaccount_row; ?>" class="form-control" />
                        </div>
                      </div>
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-bankaccount-1<?php echo $bankaccount_row; ?>"><?php echo $entry_bankaccount_1; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="bankaccount[<?php echo $bankaccount_row; ?>][bankaccount_1]" value="<?php echo $bankaccount['bankaccount_1']; ?>" placeholder="<?php echo $entry_bankaccount_1; ?>" id="input-bankaccount-1<?php echo $bankaccount_row; ?>" class="form-control" />
                          <?php if (isset($error_bankaccount[$bankaccount_row]['bankaccount_1'])) { ?>
                          <div class="text-danger"><?php echo $error_bankaccount[$bankaccount_row]['bankaccount_1']; ?></div>
                          <?php } ?>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-bankaccount-2<?php echo $bankaccount_row; ?>"><?php echo $entry_bankaccount_2; ?></label>
                        <div class="col-sm-10">
                          <input type="text" name="bankaccount[<?php echo $bankaccount_row; ?>][bankaccount_2]" value="<?php echo $bankaccount['bankaccount_2']; ?>" placeholder="<?php echo $entry_bankaccount_2; ?>" id="input-bankaccount-2<?php echo $bankaccount_row; ?>" class="form-control" />
                        </div>
                      </div>
                 </div>
                    <?php $bankaccount_row++; ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <?php if ($beneficiary_id) { ?>
					<div class="tab-pane" id="tab-more_details">
             			  
        <div class="col-md-10">
      
			   <table class="table">
            <tbody>
              <tr>  
				
                			  
                
               
                  <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
                  <button type="button" id="button-beneficiary_add_image" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_save; ?></button>
                  <button type="button" id="button-beneficiary_delete_image" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><i class="fa fa-times"></i> <?php echo $button_remove; ?></button>
            
              
              </tr>
			       </tbody>
          </table>
           
      
        
  
  
        <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-facebook"><?php echo $entry_facebook; ?></label>
                  
                    <div class="input-group">
                      <input type="text" name="facebook" value="<?php echo $facebook; ?>" id="input-facebook" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" id="button-facebook" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_save; ?></button>
                      </span></div>
                  
                </div>
                
                    <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-twitter"><?php echo $entry_twitter; ?></label>
                  
                    <div class="input-group">
                      <input type="text" name="twitter" value="<?php echo $twitter; ?>" id="input-twitter" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" id="button-twitter" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_save; ?></button>
                      </span></div>
                 
                </div>
    
                
                     <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-googleplus"><?php echo $entry_googleplus; ?></label>
                 
                    <div class="input-group">
                      <input type="text" name="googleplus" value="<?php echo $googleplus; ?>" id="input-googleplus" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" id="button-googleplus" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_save; ?></button>
                      </span></div>
               
                </div>
   
               
                     <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-instagram"><?php echo $entry_instagram; ?></label>
                 
                    <div class="input-group">
                      <input type="text" name="instagram" value="<?php echo $instagram; ?>" id="input-instagram" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" id="button-instagram" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_save; ?></button>
                      </span></div>
                 
                </div>
   
                

      </div>
     
      
			
   

            </div>
           				<div class="tab-pane" id="tab-categories">
             
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" />
                  <div id="beneficiary-category" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($beneficiary_categories as $beneficiary_category) { ?>
                    <div id="beneficiary-category<?php echo $beneficiary_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $beneficiary_category['name']; ?>
                      <input type="hidden" name="beneficiary_category[]" value="<?php echo $beneficiary_category['category_id']; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </div>

            </div>
				<div class="tab-pane" id="tab-badge">
              <div id="badge"></div>
              <br />

            </div>
              <div class="tab-pane" id="tab-beneficiaryproduct">
              <div id="beneficiaryproduct"></div>
              <br />
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-beneficiaryproduct-product"><?php echo $entry_product; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="product" value="" placeholder="<?php echo $entry_product; ?>" id="input-beneficiaryproduct-product" class="form-control" />
                <input type="hidden" name="product_id" value="" />
                </div>
              </div>
                <div class="text-right">
                <button type="button" id="button-beneficiaryproduct" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_product_add; ?></button>
                <button type="button" id="button-beneficiaryproductdelete" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-remove"></i> <?php echo $button_product_delete; ?></button>
              </div>
            </div>
        
            <div class="tab-pane" id="tab-history">
              <div id="history"></div>
              <br />
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                <div class="col-sm-10">
                  <textarea name="comment" rows="8" placeholder="<?php echo $entry_comment; ?>" id="input-comment" class="form-control"></textarea>
                </div>
              </div>
              <div class="text-right">
                <button id="button-history" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_history_add; ?></button>
              </div>
            </div>
            <div class="tab-pane" id="tab-transaction">
              <div id="transaction"></div>
              <br />
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-transaction-description"><?php echo $entry_description; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="description" value="" placeholder="<?php echo $entry_description; ?>" id="input-transaction-description" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-amount"><?php echo $entry_amount; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="amount" value="" placeholder="<?php echo $entry_amount; ?>" id="input-amount" class="form-control" />
                </div>
              </div>
              <div class="text-right">
                <button type="button" id="button-transaction" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_transaction_add; ?></button>
              </div>
            </div>
            <div class="tab-pane" id="tab-reward">
              <div id="reward"></div>
              <br />
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-reward-description"><?php echo $entry_description; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="description" value="" placeholder="<?php echo $entry_description; ?>" id="input-reward-description" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-points"><span data-toggle="tooltip" title="<?php echo $help_points; ?>"><?php echo $entry_points; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="points" value="" placeholder="<?php echo $entry_points; ?>" id="input-points" class="form-control" />
                </div>
              </div>
              <div class="text-right">
                <button type="button" id="button-reward" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_reward_add; ?></button>
              </div>
            </div>
            <?php } ?>
         </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('select[name=\'beneficiary_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=customer/customer/customfield&token=<?php echo $token; ?>&beneficiary_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('.custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('.custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'beneficiary_group_id\']').trigger('change');
//--></script> 
  <script type="text/javascript"><!--
var bankaccount_row = <?php echo $bankaccount_row; ?>;

function addbankaccount() {
	html  = '<div class="tab-pane" id="tab-bankaccount' + bankaccount_row + '">';
	html += '  <input type="hidden" name="bankaccount[' + bankaccount_row + '][bankaccount_id]" value="" />';

	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-2 control-label" for="input-firstname' + bankaccount_row + '"><?php echo $entry_firstname; ?></label>';
	html += '    <div class="col-sm-10"><input type="text" name="bankaccount[' + bankaccount_row + '][firstname]" value="" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname' + bankaccount_row + '" class="form-control" /></div>';
	html += '  </div>';

	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-2 control-label" for="input-lastname' + bankaccount_row + '"><?php echo $entry_lastname; ?></label>';
	html += '    <div class="col-sm-10"><input type="text" name="bankaccount[' + bankaccount_row + '][lastname]" value="" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname' + bankaccount_row + '" class="form-control" /></div>';
	html += '  </div>';
	
	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-2 control-label" for="input-bank' + bankaccount_row + '"><?php echo $entry_bank; ?></label>';
	html += '    <div class="col-sm-10"><select name="bankaccount[' + bankaccount_row + '][bank_id]" id="input-bank' + bankaccount_row + '" onchange="bank(this, \'' + bankaccount_row + '\', \'0\');" class="form-control">';
    html += '         <option value=""><?php echo $text_select; ?></option>';
    <?php foreach ($banks as $bank) { ?>
    html += '         <option value="<?php echo $bank['bank_id']; ?>"><?php echo addslashes($bank['title']); ?></option>';
    <?php } ?>
    html += '      </select></div>';
	html += '  </div>';
	
	html += '  <div class="form-group">';
	html += '    <label class="col-sm-2 control-label" for="input-branch_id' + bankaccount_row + '"><?php echo $entry_branch_id; ?></label>';
	html += '    <div class="col-sm-10"><input type="text" name="bankaccount[' + bankaccount_row + '][branch_id]" value="" placeholder="<?php echo $entry_branch_id; ?>" id="input-branch_id' + bankaccount_row + '" class="form-control" /></div>';
	html += '  </div>';
	
	html += '  <div class="form-group">';
	html += '    <label class="col-sm-2 control-label" for="input-company_id' + bankaccount_row + '"><?php echo $entry_company_id; ?></label>';
	html += '    <div class="col-sm-10"><input type="text" name="bankaccount[' + bankaccount_row + '][company_id]" value="" placeholder="<?php echo $entry_company_id; ?>" id="input-company_id' + bankaccount_row + '" class="form-control" /></div>';
	html += '  </div>';

	html += '  <div class="form-group required">';
	html += '    <label class="col-sm-2 control-label" for="input-bankaccount-1' + bankaccount_row + '"><?php echo $entry_bankaccount_1; ?></label>';
	html += '    <div class="col-sm-10"><input type="text" name="bankaccount[' + bankaccount_row + '][bankaccount_1]" value="" placeholder="<?php echo $entry_bankaccount_1; ?>" id="input-bankaccount-1' + bankaccount_row + '" class="form-control" /></div>';
	html += '  </div>';

	html += '  <div class="form-group">';
	html += '    <label class="col-sm-2 control-label" for="input-bankaccount-2' + bankaccount_row + '"><?php echo $entry_bankaccount_2; ?></label>';
	html += '    <div class="col-sm-10"><input type="text" name="bankaccount[' + bankaccount_row + '][bankaccount_2]" value="" placeholder="<?php echo $entry_bankaccount_2; ?>" id="input-bankaccount-2' + bankaccount_row + '" class="form-control" /></div>';
	html += '  </div>';

	
	$('#tab-general .tab-content').prepend(html);

	$('select[name=\'beneficiary_group_id\']').trigger('change');

	$('select[name=\'bankaccount[' + bankaccount_row + '][country_id]\']').trigger('change');

	$('#bankaccount-add').before('<li><a href="#tab-bankaccount' + bankaccount_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'#bankaccount a:first\').tab(\'show\'); $(\'a[href=\\\'#tab-bankaccount' + bankaccount_row + '\\\']\').parent().remove(); $(\'#tab-bankaccount' + bankaccount_row + '\').remove();"></i> <?php echo $tab_bankaccount; ?> ' + bankaccount_row + '</a></li>');

	$('#bankaccount a[href=\'#tab-bankaccount' + bankaccount_row + '\']').tab('show');

	$('.date').datetimepicker({
		pickTime: false
	});
	
	$('.datetime').datetimepicker({
		pickDate: true,
		pickTime: true
	});
	
	$('.time').datetimepicker({
		pickDate: false
	});	

	bankaccount_row++;
}
//--></script> 
  <script type="text/javascript"><!--
function country(element, index, zone_id) {
  if (element.value != '') {
		$.ajax({
			url: 'index.php?route=beneficiary/beneficiary/country&token=<?php echo $token; ?>&country_id=' + element.value,
			dataType: 'json',
			beforeSend: function() {
				$('select[name=\'bankaccount[' + index + '][country_id]\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
			},
			complete: function() {
				$('.fa-spin').remove();
			},
			success: function(json) {
				if (json['postcode_required'] == '1') {
					$('input[name=\'bankaccount[' + index + '][postcode]\']').parent().addClass('required');
				} else {
					$('input[name=\'bankaccount[' + index + '][postcode]\']').parent().parent().removeClass('required');
				}

				html = '<option value=""><?php echo $text_select; ?></option>';

				if (json['zone']) {
					for (i = 0; i < json['zone'].length; i++) {
						html += '<option value="' + json['zone'][i]['zone_id'] + '"';

						if (json['zone'][i]['zone_id'] == zone_id) {
							html += ' selected="selected"';
						}

						html += '>' + json['zone'][i]['name'] + '</option>';
					}
				} else {
					html += '<option value="0"><?php echo $text_none; ?></option>';
				}

				$('select[name=\'bankaccount[' + index + '][zone_id]\']').html(html);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

$('select[name$=\'[country_id]\']').trigger('change');
//--></script> 
 <script type="text/javascript"><!--
$('#badge').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#badge').load(this.href);
});

$('#badge').load('index.php?route=beneficiary/beneficiary/badge&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>');

$('#button-badge').on('click', function(e) {
  e.preventDefault();

	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/badge&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'comment=' + encodeURIComponent($('#tab-badge textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('#button-badge').button('loading');
		},
		complete: function() {
			$('#button-badge').button('reset');
		},
		success: function(html) {
			$('.alert').remove();

			$('#badge').html(html);

			$('#tab-badge textarea[name=\'comment\']').val('');
		}
	});
});
//--></script> 
  <script type="text/javascript"><!--
$('#beneficiaryproduct').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#beneficiaryproduct').load(this.href);
});

$('#beneficiaryproduct').load('index.php?route=beneficiary/beneficiary/beneficiaryproduct&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>');

$('#button-beneficiaryproduct').on('click', function(e) {
  e.preventDefault();

	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/beneficiaryproduct&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'product_id=' + encodeURIComponent($('#tab-beneficiaryproduct input[name=\'product_id\']').val())+ '&beneficiary_id=<?php echo $beneficiary_id; ?>',
		beforeSend: function() {
			$('#button-beneficiaryproduct').button('loading');
		},
		complete: function() {
			$('#button-beneficiaryproduct').button('reset');
		},
		success: function(html) {
			$('.alert').remove();

			$('#beneficiaryproduct').html(html);

			$('#tab-beneficiaryproduct input[name=\'product\']').val('');
		}
	});
});

$('#button-beneficiaryproductdelete').on('click', function(e) {
	if(confirm('<?php echo $text_confirm; ?>')){
		
  e.preventDefault();

	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/beneficiaryproductdelete&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		type: 'post',
		dataType: 'html',
		data:  $('#tab-beneficiaryproduct input[name=\'selected[]\']').serialize(),
		beforeSend: function() {
			$('#button-beneficiaryproductdelete').button('loading');
		},
		complete: function() {
			$('#button-beneficiaryproductdelete').button('reset');
		},
		success: function(html) {
			$('.alert').remove();

			$('#beneficiaryproduct').html(html);

			$('#tab-beneficiaryproduct textarea[name=\'comment\']').val('');
		}
	});
}else{
	 return false;
 }
	
});

$('#tab-beneficiaryproduct input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id'],
						model: item['model'],
						option: item['option'],
						price: item['price']						
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#tab-beneficiaryproduct input[name=\'product\']').val(item['label']);
		$('#tab-beneficiaryproduct input[name=\'product_id\']').val(item['value']);
		
	}	
});
//--></script> 
  <script type="text/javascript"><!--
$('#history').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#history').load(this.href);
});

$('#history').load('index.php?route=beneficiary/beneficiary/history&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>');

$('#button-history').on('click', function(e) {
  e.preventDefault();

	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/history&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'comment=' + encodeURIComponent($('#tab-history textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('#button-history').button('loading');
		},
		complete: function() {
			$('#button-history').button('reset');
		},
		success: function(html) {
			$('.alert').remove();

			$('#history').html(html);

			$('#tab-history textarea[name=\'comment\']').val('');
		}
	});
});
//--></script> 
  <script type="text/javascript"><!--
$('#transaction').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#transaction').load(this.href);
});

$('#transaction').load('index.php?route=beneficiary/beneficiary/transaction&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>');

$('#button-transaction').on('click', function(e) {
  e.preventDefault();

  $.ajax({
		url: 'index.php?route=beneficiary/beneficiary/transaction&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'description=' + encodeURIComponent($('#tab-transaction input[name=\'description\']').val()) + '&amount=' + encodeURIComponent($('#tab-transaction input[name=\'amount\']').val()),
		beforeSend: function() {
			$('#button-transaction').button('loading');
		},
		complete: function() {
			$('#button-transaction').button('reset');
		},
		success: function(html) {
			$('.alert').remove();

			$('#transaction').html(html);

			$('#tab-transaction input[name=\'amount\']').val('');
			$('#tab-transaction input[name=\'description\']').val('');
		}
	});
});
//--></script> 
  <script type="text/javascript"><!--
$('#reward').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#reward').load(this.href);
});

$('#reward').load('index.php?route=beneficiary/beneficiary/reward&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>');

$('#button-reward').on('click', function(e) {
	e.preventDefault();

	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/reward&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		type: 'post',
		dataType: 'html',
		data: 'description=' + encodeURIComponent($('#tab-reward input[name=\'description\']').val()) + '&points=' + encodeURIComponent($('#tab-reward input[name=\'points\']').val()),
		beforeSend: function() {
			$('#button-reward').button('loading');
		},
		complete: function() {
			$('#button-reward').button('reset');
		},
		success: function(html) {
			$('.alert').remove();

			$('#reward').html(html);

			$('#tab-reward input[name=\'points\']').val('');
			$('#tab-reward input[name=\'description\']').val('');
		}
	});
});

$('#ip').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#ip').load(this.href);
});

$('#ip').load('index.php?route=beneficiary/beneficiary/ip&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>');

$('body').delegate('.button-ban-add', 'click', function() {
	var element = this;

	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/addbanip&token=<?php echo $token; ?>',
		type: 'post',
		dataType: 'json',
		data: 'ip=' + encodeURIComponent(this.value),
		beforeSend: function() {
			$(element).button('loading');
		},
		complete: function() {
			$(element).button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				 $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');

				$('.alert').fadeIn('slow');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$(element).replaceWith('<button type="button" value="' + element.value + '" class="btn btn-danger btn-xs button-ban-remove"><i class="fa fa-minus-circle"></i> <?php echo $text_remove_ban_ip; ?></button>');
			}
		}
	});
});

$('body').delegate('.button-ban-remove', 'click', function() {
	var element = this;

	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/removebanip&token=<?php echo $token; ?>',
		type: 'post',
		dataType: 'json',
		data: 'ip=' + encodeURIComponent(this.value),
		beforeSend: function() {
			$(element).button('loading');
		},
		complete: function() {
			$(element).button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				 $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				 $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$(element).replaceWith('<button type="button" value="' + element.value + '" class="btn btn-success btn-xs button-ban-add"><i class="fa fa-plus-circle"></i> <?php echo $text_add_ban_ip; ?></button>');
			}
		}
	});
});

$('#content').delegate('button[id^=\'button-custom-field\'], button[id^=\'button-bankaccount\']', 'click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	$('#form-upload input[name=\'file\']').on('change', function() {
		$.ajax({
			url: 'index.php?route=tool/upload/upload&token=<?php echo $token; ?>',
			type: 'post',		
			dataType: 'json',
			data: new FormData($(this).parent()[0]),
			cache: false,
			contentType: false,
			processData: false,		
			beforeSend: function() {
				$(node).button('loading');
			},
			complete: function() {
				$(node).button('reset');
			},		
			success: function(json) {
				$('.text-danger').remove();
				
				if (json['error']) {
					$(node).parent().find('input[type=\'hidden\']').after('<div class="text-danger">' + json['error'] + '</div>');
				}
							
				if (json['success']) {
					alert(json['success']);
				}
				
				if (json['code']) {
					$(node).parent().find('input[type=\'hidden\']').attr('value', json['code']);
				}
			},			
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});

$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});	

$(document).delegate('#button-beneficiary_add_image', 'click', function() {
	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/beneficiary_add_image&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		dataType: 'json',
		data: 'beneficiary_image=' + encodeURIComponent($('#tab-more_details input[name=\'image\']').val()),
		beforeSend: function() {
			$('#button-beneficiary_add_image').button('loading');
		},
		complete: function() {
						$('#button-beneficiary_add_image').button('reset');

			$('#button-beneficiary_add_image').addClass('btn-success');
			$('#button-beneficiary_add_image').removeClass('btn-primary');
		
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['beneficiary_add_image_no']) {
				$('#beneficiary_add_image').html(json['beneficiary_add_image_no']);

				$('#button-beneficiary_add_image').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});


$(document).delegate('#button-beneficiary_delete_image', 'click', function() {
	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/beneficiary_delete_image&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		dataType: 'json',
		data: 'beneficiary_image=' + encodeURIComponent($('#tab-beneficiary input[name=\'image\']').val()),
		beforeSend: function() {
			$('#button-beneficiary_delete_image').button('loading');
		},
		complete: function() {
						$('#button-beneficiary_delete_image').button('reset');

			$('#button-beneficiary_delete_image').addClass('btn-success');
			$('#button-beneficiary_delete_image').removeClass('btn-primary');
		
			$('#thumb-image').find('img').attr('src', $('#thumb-image').find('img').attr('data-placeholder'));
			
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['beneficiary_delete_image_no']) {
				$('#beneficiary_delete_image').html(json['beneficiary_delete_image_no']);

				$('#button-beneficiary_delete_image').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-facebook', 'click', function() {
	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/facebook&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		dataType: 'json',
		data: 'beneficiary_facebook=' + encodeURIComponent($('#tab-more_details input[name=\'facebook\']').val()),
		beforeSend: function() {
			$('#button-facebook').button('loading');
		},
		complete: function() {
						$('#button-facebook').button('reset');

			$('#button-facebook').addClass('btn-success');
			$('#button-facebook').removeClass('btn-primary');
		
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['facebook_no']) {
				$('#facebook').html(json['facebook_no']);

				$('#button-facebook').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-twitter', 'click', function() {
	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/twitter&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		dataType: 'json',
		data: 'beneficiary_twitter=' + encodeURIComponent($('#tab-more_details input[name=\'twitter\']').val()),
		beforeSend: function() {
			$('#button-twitter').button('loading');
		},
		complete: function() {
						$('#button-twitter').button('reset');

			$('#button-twitter').addClass('btn-success');
			$('#button-twitter').removeClass('btn-primary');
		
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['twitter_no']) {
				$('#twitter').html(json['twitter_no']);

				$('#button-twitter').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-googleplus', 'click', function() {
	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/googleplus&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		dataType: 'json',
		data: 'beneficiary_googleplus=' + encodeURIComponent($('#tab-more_details input[name=\'googleplus\']').val()),
		beforeSend: function() {
			$('#button-googleplus').button('loading');
		},
		complete: function() {
						$('#button-googleplus').button('reset');

			$('#button-googleplus').addClass('btn-success');
			$('#button-googleplus').removeClass('btn-primary');
		
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['googleplus_no']) {
				$('#googleplus').html(json['googleplus_no']);

				$('#button-googleplus').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-instagram', 'click', function() {
	$.ajax({
		url: 'index.php?route=beneficiary/beneficiary/instagram&token=<?php echo $token; ?>&beneficiary_id=<?php echo $beneficiary_id; ?>',
		dataType: 'json',
		data: 'beneficiary_instagram=' + encodeURIComponent($('#tab-more_details input[name=\'instagram\']').val()),
		beforeSend: function() {
			$('#button-instagram').button('loading');
		},
		complete: function() {
						$('#button-instagram').button('reset');

			$('#button-instagram').addClass('btn-success');
			$('#button-instagram').removeClass('btn-primary');
		
			
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['instagram_no']) {
				$('#instagram').html(json['instagram_no']);

				$('#button-instagram').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

//--></script>
   <script type="text/javascript"><!--
// Category
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'category\']').val('');

		$('#beneficiary-category' + item['value']).remove();

		$('#beneficiary-category').append('<div id="beneficiary-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="beneficiary_category[]" value="' + item['value'] + '" /></div>');
	}
});

$('#beneficiary-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script> 

</div>
<?php echo $footer; ?>
