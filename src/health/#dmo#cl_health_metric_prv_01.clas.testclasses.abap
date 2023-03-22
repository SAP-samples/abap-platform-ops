class ltc_health_metric_provider definition deferred.
class /dmo/cl_health_metric_prv_01 definition local friends ltc_health_metric_provider.

class ltc_health_metric_provider definition for testing
  duration medium
  risk level harmless.

  private section.

    data: mo_metric_provider type ref to /dmo/cl_health_metric_prv_01.

    class-methods: class_setup.
    class-methods: class_teardown.

    methods: setup.
    methods: teardown.

    methods: get_metric_values_s01 for testing.
    methods: get_metric_values_s02 for testing.

endclass.

class ltc_health_metric_provider implementation.

  method class_setup.

  endmethod.

  method class_teardown.

  endmethod.

  method setup.

    try.
        me->mo_metric_provider = new /dmo/cl_health_metric_prv_01( ).
      catch cx_gsm_api into data(lx_gsm_api).
        cl_abap_unit_assert=>fail(
          msg = lx_gsm_api->if_message~get_text( ) ).
    endtry.

  endmethod.

  method teardown.

  endmethod.

  method get_metric_values_s01.

    " scenario
    " -------------------------------------------------------------------------
    " Simple test with mocked API and complete verify.

    try.
        " prepare
        " ---------------------------------------------------------------------

        me->mo_metric_provider->mo_api_access = new ltd_api_access( ).

        data(lo_api_test) = cl_gsm_api_test=>get_instance( ).

        " execute
        " ---------------------------------------------------------------------

        lo_api_test->get_metric_values(
          exporting
            io_provider      = me->mo_metric_provider
          importing
            et_metric_values = data(lt_metric_values_act)
            et_messages      = data(lt_messages) ).

        " verify
        " ---------------------------------------------------------------------
        " Dedicated test with literals to detect potential changes for constant
        " values.

        data(lt_metric_values_exp) = value if_gsm_api_types=>tt_metric_values(
          ( metric_id    = /dmo/cl_health_metric_prv_01=>e_metric_id-demo_metric_id
            value_count  = 1
            value_sum    = '8'
            value_min    = '8'
            value_max    = '8'
            value_rating = 1
            attributes   = value #(
              ( attribute_id = /dmo/cl_health_metric_prv_01=>e_attribute_id-demo_attr_01
                value        = 'business'
              )
            )
          )
          ( metric_id    = /dmo/cl_health_metric_prv_01=>e_metric_id-demo_metric_id
            value_count  = 1
            value_sum    = '41'
            value_min    = '41'
            value_max    = '41'
            value_rating = 2
            attributes   = value #(
              ( attribute_id = /dmo/cl_health_metric_prv_01=>e_attribute_id-demo_attr_01
                value        = 'technical'
              )
            )
          )
        ).

        lo_api_test->assert_equals_values(
          it_metric_values_act = lt_metric_values_act
          it_metric_values_exp = lt_metric_values_exp ).

      catch cx_gsm_api into data(lx_gsm_api).
        cl_abap_unit_assert=>fail(
          msg = lx_gsm_api->if_message~get_text( ) ).
    endtry.

  endmethod.

  method get_metric_values_s02.

    " scenario
    " -------------------------------------------------------------------------
    " Simple test with real API but partial verify.

    try.
        " prepare
        " ---------------------------------------------------------------------

        me->mo_metric_provider->mo_api_access = new ltd_api_access( ).

        data(lo_api_test) = cl_gsm_api_test=>get_instance( ).

        " execute
        " ---------------------------------------------------------------------

        lo_api_test->get_metric_values(
          exporting
            io_provider      = me->mo_metric_provider
          importing
            et_metric_values = data(lt_metric_values_act)
            et_messages      = data(lt_messages) ).

        " verify
        " ---------------------------------------------------------------------

        lo_api_test->assert_metrics_exist(
          it_metric_values_act = lt_metric_values_act
          it_metrics           = value #(
            ( metric_id = /dmo/cl_health_metric_prv_01=>e_metric_id-demo_metric_id )
          )
        ).

      catch cx_gsm_api into data(lx_gsm_api).
        cl_abap_unit_assert=>fail(
          msg = lx_gsm_api->if_message~get_text( ) ).
    endtry.

  endmethod.

endclass.
