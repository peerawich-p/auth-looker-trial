view: fact_customer_segment {

  sql_table_name: CDP.FACT_CUSTOMER_SEGMENT;;

  dimension: date_cd {
    label: "DATE_CD"
    type: date_time
    sql: ${TABLE}.DATE_CD ;;
  }
  dimension: customer_cd {
    label: "CUSTOMER_CD"
    type: string
    sql: ${TABLE}.CUSTOMER_CD ;;
  }
  dimension: store_cd {
    label: "STORE_CD"
    type: string
    sql: ${TABLE}.STORE_CD ;;
  }
  dimension: segment_cd {
    label: "SEGMENT_CD"
    type: string
    sql: ${TABLE}.SEGMENT_CD ;;
  }
  measure: acc_15_months_frequency {
    label: "ACC_15_MONTHS_FREQUENCY"
    type: number
    sql: ${TABLE}.ACC_15_MONTHS_FREQUENCY ;;
  }
  measure: acc_15_months_value {
    label: "ACC_15_MONTHS_VALUE"
    type: number
    sql: ${TABLE}.ACC_15_MONTHS_VALUE ;;
  }
  measure: lifetime_value {
    label: "LIFETIME_VALUE"
    type: number
    sql: ${TABLE}.LIFETIME_VALUE ;;
  }
  measure: days_last_purchase {
    label: "DAYS_LAST_PURCHASE"
    type: number
    sql: ${TABLE}.DAYS_LAST_PURCHASE ;;
  }
  measure: recency_percentile {
    label: "RECENCY_PERCENTILE"
    type: number
    sql: ${TABLE}.RECENCY_PERCENTILE ;;
  }
  measure: frequency_percentile {
    label: "FREQUENCY_PERCENTILE"
    type: number
    sql: ${TABLE}.FREQUENCY_PERCENTILE ;;
  }
  measure: monetary_percentile {
    label: "MONETARY_PERCENTILE"
    type: number
    sql: ${TABLE}.MONETARY_PERCENTILE ;;
  }
}
