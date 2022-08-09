view: fact_store_sales {

  sql_table_name: CDP.FACT_STORE_SALES ;;

  # derived_table: {
  #   sql: SELECT
  #       *
  #     FROM CDP.FACT_STORE_SALES
  #     ;;
  # }
  dimension: date_cd {
    label: "DATE_CD"
    type: date_time
    sql: ${TABLE}.DATE_CD ;;
  }

  dimension: store_cd {
    label: "STORE_CD"
    type: string
    sql: ${TABLE}.STORE_CD ;;
  }

  measure: purchase_value_after_tax_freight {
    label: "PURCHASE_VALUE_AFTER_TAX_FREIGHT"
    type: sum
    sql: ${TABLE}.PURCHASE_VALUE_AFTER_TAX_FREIGHT ;;
  }

  measure: last_day_purchase_value_after_tax_freight {
    label: "LAST_DAY_PURCHASE_VALUE_AFTER_TAX_FREIGHT"
    type: sum
    sql: ${TABLE}.LAST_DAY_PURCHASE_VALUE_AFTER_TAX_FREIGHT ;;
  }

  measure: current_year_mtd_value {
    label: "CURRENT_YEAR_MTD_VALUE"
    type: sum
    sql: ${TABLE}.CURRENT_YEAR_MTD_VALUE ;;
  }

  measure: last_year_mtd_value {
    label: "LAST_YEAR_MTD_VALUE"
    type: sum
    sql: ${TABLE}.LAST_YEAR_MTD_VALUE ;;
  }

  measure: current_year_ytd_value {
    label: "CURRENT_YEAR_YTD_VALUE"
    type: sum
    sql: ${TABLE}.CURRENT_YEAR_YTD_VALUE ;;
  }

  measure: last_year_ytd_value {
    label: "LAST_YEAR_YTD_VALUE"
    type: sum
    sql: ${TABLE}.LAST_YEAR_YTD_VALUE ;;
  }

  measure: customers_count {
    label: "CUSTOMERS_COUNT"
    type: sum
    sql: ${TABLE}.CUSTOMERS_COUNT ;;
  }

  measure: orders_count {
    label: "ORDERS_COUNT"
    type: sum
    sql: ${TABLE}.ORDERS_COUNT ;;
  }

  measure: purchase_value_before_tax {
    label: "PURCHASE_VALUE_BEFORE_TAX"
    type: sum
    sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX ;;
  }

}
