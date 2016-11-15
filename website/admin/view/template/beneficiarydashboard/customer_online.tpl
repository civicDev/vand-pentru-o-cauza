<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-ip"><?php echo $entry_ip; ?></label>
                <input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" id="input-ip" placeholder="<?php echo $entry_ip; ?>" i class="form-control" />
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-beneficiary"><?php echo $entry_beneficiary; ?></label>
                <input type="text" name="filter_beneficiary" value="<?php echo $filter_beneficiary; ?>" placeholder="<?php echo $entry_beneficiary; ?>" id="input-beneficiary" class="form-control" />
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left"><?php echo $column_ip; ?></td>
                <td class="text-left"><?php echo $column_beneficiary; ?></td>
                <td class="text-left"><?php echo $column_url; ?></td>
                <td class="text-left"><?php echo $column_referer; ?></td>
                <td class="text-left"><?php echo $column_date_added; ?></td>
                <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($beneficiarys) { ?>
              <?php foreach ($beneficiarys as $beneficiary) { ?>
              <tr>
                <td class="text-left"><a href="http://whatismyipaddress.com/ip/<?php echo $beneficiary['ip']; ?>" target="_blank"><?php echo $beneficiary['ip']; ?></a></td>
                <td class="text-left"><?php echo $beneficiary['beneficiary']; ?></td>
                <td class="text-left"><a href="<?php echo $beneficiary['url']; ?>" target="_blank"><?php echo implode('<br/>', str_split($beneficiary['url'], 30)); ?></a></td>
                <td class="text-left"><?php if ($beneficiary['referer']) { ?>
                  <a href="<?php echo $beneficiary['referer']; ?>" target="_blank"><?php echo implode('<br/>', str_split($beneficiary['referer'], 30)); ?></a>
                  <?php } ?></td>
                <td class="text-left"><?php echo $beneficiary['date_added']; ?></td>
                <td class="text-right"><?php if ($beneficiary['customer_id']) { ?>
                  <a href="<?php echo $beneficiary['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                <?php } else { ?>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary" disabled="disabled"><i class="fa fa-pencil"></i></button>
                <?php } ?>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=beneficiarydashboard/beneficiary_online&token=<?php echo $token; ?>';
	
	var filter_beneficiary = $('input[name=\'filter_beneficiary\']').val();
	
	if (filter_beneficiary) {
		url += '&filter_beneficiary=' + encodeURIComponent(filter_beneficiary);
	}
		
	var filter_ip = $('input[name=\'filter_ip\']').val();
	
	if (filter_ip) {
		url += '&filter_ip=' + encodeURIComponent(filter_ip);
	}
				
	location = url;
});
//--></script></div>
<?php echo $footer; ?>
