view: fact_customer_status_temp {

  sql_table_name: CDP.FACT_CUSTOMER_STATUS_TEMP;;

  dimension: date_cd {
    label: "DATE_CD"
    type: date_time
    sql: ${TABLE}.DATE_CD ;;
  }
# CUSTOMER_CD STRING
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
  measure: count_customer {
    description: "for show visualize frequency"
    label: "COUNT_CUSTOMER"
    type: count_distinct
    # filters: []
    sql: ${customer_cd};;
  }
  measure: count_customer_new {
    label: "COUNT_CUSTOMER_NEW"
    type: count_distinct
    filters: {
      field: is_new_old
      value: "NEW"
    }
    sql: ${customer_cd};;
  }
  measure: count_customer_old {
    label: "COUNT_CUSTOMER_OLD"
    type: count_distinct
    filters: {
      field: is_new_old
      value: "OLD"
    }
    sql: ${customer_cd};;
  }
  measure: count_customer_return {
    label: "COUNT_CUSTOMER_RETURN"
    type: count_distinct
    filters: {
      field: is_new_old
      value: "RETURN"
    }
    sql: ${customer_cd};;
  }
  # measure: red_total {
  #   type: sum
  #   sql: ${amount} ;;
  #   filters: {
  #     field: color
  #     value: "red"
  #   }
  # }

# LAST_PURCHASE_DATE  DATETIME
  dimension: last_purchase_date {
    label: "LAST_PURCHASE_DATE"
    type: date_time
    sql: ${TABLE}.LAST_PURCHASE_DATE ;;
  }
# CHURN_RISK  FLOAT
  measure: churn_risk {
    label: "CHURN_RISK"
    type: number
    sql: ${TABLE}.CHURN_RISK ;;
  }
# CUMULATIVE_PURCHASE_FREQUENCY INTEGER
  measure: cumulative_purchase_frequency {
    label: "CUMULATIVE_PURCHASE_FREQUENCY"
    type: number
    sql: ${TABLE}.CUMULATIVE_PURCHASE_FREQUENCY ;;
  }
# IS_NEW_OLD  STRING
  dimension: is_new_old {
    label: "IS_NEW_OLD"
    type: string
    sql: ${TABLE}.IS_NEW_OLD ;;
  }
# IS_ACTIVE STRING
  dimension: is_active {
    label: "IS_ACTIVE"
    type: string
    sql: ${TABLE}.IS_ACTIVE ;;
  }
# DAY_DIFF_FROM_LAST_PURCHASE INTEGER
  measure: day_diff_from_last_purchase {
    label: "DAY_DIFF_FROM_LAST_PURCHASE"
    type: number
    sql: ${TABLE}.DAY_DIFF_FROM_LAST_PURCHASE ;;
  }
# LIFETIME_VALUE  FLOAT
  measure: lifetime_value {
    label: "LIFETIME_VALUE"
    type: number
    sql: ${TABLE}.LIFETIME_VALUE ;;
  }

}
