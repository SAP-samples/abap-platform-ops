class /DMO/CL_HEALTH_METRIC_PRV_01 definition
  public
  final
  create public .

public section.

  interfaces IF_GSM_API_PROVIDER .

  constants:
    begin of e_metric_group_id,
        demo_group type if_gsm_api_types=>tv_metric_group_id value 'demo_health_metric_provider_01',
      end of e_metric_group_id .
  constants:
    begin of e_metric_id,
        demo_metric_id type if_gsm_api_types=>tv_metric_id value 'demo_health_metric_01',
      end of e_metric_id .
  constants:
    begin of e_attribute_id,
        demo_attr_01 type if_gsm_api_types=>tv_attribute_id value 'demo_health_metric_attr_01',
      end of e_attribute_id .

  methods CONSTRUCTOR .
  protected section.
private section.

  data MO_API_ACCESS type ref to LIF_API_ACCESS .
ENDCLASS.



CLASS /DMO/CL_HEALTH_METRIC_PRV_01 IMPLEMENTATION.


  method constructor.

    me->mo_api_access = new lcl_api_access( ).

  endmethod.


  method IF_GSM_API_PROVIDER~DEFINE_MODEL.
    data: lo_api_metric_group type ref to if_gsm_api_metric_group.

    lo_api_metric_group = io_model->add_metric_group(
      iv_metric_group_id   = me->e_metric_group_id-demo_group
      iv_metric_group_name = `Demo Health Metric Provider` ##NO_TEXT
      iv_category          = if_gsm_api_constants=>e_category-usage
      iv_severity          = if_gsm_api_constants=>e_severity-_2_low ).

    lo_api_metric_group->add_target(
      iv_target_type       = if_gsm_api_constants=>e_target_type-health ).

    lo_api_metric_group->add_metric(
      iv_metric_id         = me->e_metric_id-demo_metric_id
      iv_metric_name       = `Demo Health Metric` ##NO_TEXT
      iv_unit              = if_gsm_api_constants=>e_unit-seconds
      iv_data_type         = if_gsm_api_constants=>e_data_type-integer
      iv_period            = if_gsm_api_constants=>e_period-every_05_minutes
      iv_description       = `Just a demo`  ##NO_TEXT
      iv_metric_type       = if_gsm_api_constants=>e_metric_type-counter )->add_target(
      iv_target_type       = if_gsm_api_constants=>e_target_type-health ).

  endmethod.


  method if_gsm_api_provider~get_metric_values.

    data: ls_metric_value    type if_gsm_api_types=>ts_metric_value.
    data: lv_timestamp       type timestamp.

    get time stamp field lv_timestamp.

    ls_metric_value-metric_id = me->e_metric_id-demo_metric_id.
    if iv_timestamp_start is supplied and iv_timestamp_start <> 0.
      ls_metric_value-value_timestamp = iv_timestamp_start.
    elseif iv_timestamp_end is supplied and iv_timestamp_end <> 0.
      ls_metric_value-value_timestamp = iv_timestamp_end.
    else.
      ls_metric_value-value_timestamp = lv_timestamp.
    endif.

    ls_metric_value-value_count  = 1.
    ls_metric_value-value_text   = ''.

    insert value #(
      attribute_id = me->e_attribute_id-demo_attr_01
      value        = 'None' ##NO_TEXT
    ) into table ls_metric_value-attributes
      reference into data(lsr_mp_attr_01).

    " metric data
    " -------------------------------------------------------------------------
    " Retrieval of the metric values at this point in time.

    data(lt_metrics) = me->mo_api_access->get_metrics( ).

    " transformation
    " -------------------------------------------------------------------------
    " Transform the metric values format to the GSM data structures.

    loop at lt_metrics reference into data(lrs_metric).
      lsr_mp_attr_01->value     = lrs_metric->attribute.

      ls_metric_value-value_sum = lrs_metric->value.
      ls_metric_value-value_max = ls_metric_value-value_sum.
      ls_metric_value-value_min = ls_metric_value-value_sum.

      if ls_metric_value-value_sum > 10.
        ls_metric_value-value_rating = if_gsm_api_constants=>e_rating-_2_warning.
      else.
        ls_metric_value-value_rating = if_gsm_api_constants=>e_rating-_1_ok.
      endif.

      insert ls_metric_value into table et_metric_values.
    endloop.

  endmethod.


  method IF_GSM_API_PROVIDER~INITIALIZE.

  endmethod.
ENDCLASS.
