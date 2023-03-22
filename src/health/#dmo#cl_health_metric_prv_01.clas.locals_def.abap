types:
  begin of ts_demo_metric,
    value     type i,
    attribute type string,
  end of ts_demo_metric.

types:
  tt_demo_metrics type standard table of ts_demo_metric
                  with non-unique default key.

interface lif_api_access.

  methods get_metrics
    returning
      value(rt_demo_metrics) type tt_demo_metrics
    raising
      cx_gsm_api.

endinterface.
