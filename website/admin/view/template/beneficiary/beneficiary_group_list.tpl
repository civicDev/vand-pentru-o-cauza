<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $insert; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-beneficiary-group').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
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
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-beneficiary-group">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'cgd.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                    <td class="text-right"><?php if ($sort == 'cg.product_limit') { ?>
                    <a href="<?php echo $sort_product_limit; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_product_limit; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_product_limit; ?>"><?php echo $column_product_limit; ?></a>
                    <?php } ?></td>
                    <td class="text-right"><?php if ($sort == 'cg.subscription_duration') { ?>
                    <a href="<?php echo $sort_subscription_duration; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_subscription_duration; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_subscription_duration; ?>"><?php echo $column_subscription_duration; ?></a>
                    <?php } ?></td>
                          <td class="text-right"><?php if ($sort == 'cg.subscription_price') { ?>
                    <a href="<?php echo $sort_subscription_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_subscription_price; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_subscription_price; ?>"><?php echo $column_subscription_price; ?></a>
                    <?php } ?></td>
                 
                     <td class="text-right"><?php if ($sort == 'cg.sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?></td>
                      <td class="text-right"><?php if ($sort == 'cg.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($status); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($beneficiary_groups) { ?>
                <?php foreach ($beneficiary_groups as $beneficiary_group) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($beneficiary_group['beneficiary_group_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $beneficiary_group['beneficiary_group_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $beneficiary_group['beneficiary_group_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left"><?php echo $beneficiary_group['name']; ?></td>
                  <td class="text-right"><?php echo $beneficiary_group['product_limit']; ?></td>
                  <td class="text-right"><?php echo $beneficiary_group['subscription_duration']; ?></td>
                  <td class="text-right"><?php echo $beneficiary_group['subscription_price']; ?></td>
                  <td class="text-right"><?php echo $beneficiary_group['sort_order']; ?></td>
                  <td class="text-right"><?php echo $beneficiary_group['status']; ?></td>
                  <td class="text-right"><a href="<?php echo $beneficiary_group['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 
