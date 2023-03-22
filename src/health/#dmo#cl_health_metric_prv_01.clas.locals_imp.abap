class lcl_api_access definition.
  public section.
    interfaces lif_api_access.

endclass.

class lcl_api_access implementation.

  method lif_api_access~get_metrics.

    data(lo_abap_random) = cl_abap_random=>create(
      seed = cl_abap_random=>seed( ) ).

    insert value #(
      value     = lo_abap_random->intinrange( low = 5 high = 100 )
      attribute = 'business'
    ) into table rt_demo_metrics.

    insert value #(
      value     = lo_abap_random->intinrange( low = 5 high = 100 )
      attribute = 'technical'
    ) into table rt_demo_metrics.

  endmethod.

endclass.

class ltd_api_access definition.
  public section.
    interfaces lif_api_access.

endclass.

class ltd_api_access implementation.

  method lif_api_access~get_metrics.

    insert value #(
      value     = 8
      attribute = 'business'
    ) into table rt_demo_metrics.

    insert value #(
      value     = 41
      attribute = 'technical'
    ) into table rt_demo_metrics.

  endmethod.

endclass.
