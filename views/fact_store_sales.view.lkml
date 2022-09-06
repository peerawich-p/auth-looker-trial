view: fact_store_sales {

  sql_table_name: CDP.FACT_STORE_SALES ;;

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
  measure: total_store {
    label: "TOTAL_STORE"
    type: count_distinct
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
  measure: current_year_mtd_value_after_tax_freight {
    label: "CURRENT_YEAR_MTD_VALUE_AFTER_TAX_FREIGHT"
    type: sum
    sql: ${TABLE}.CURRENT_YEAR_MTD_VALUE_AFTER_TAX_FREIGHT ;;
  }
  measure: last_year_mtd_value_after_tax_freight {
    label: "LAST_YEAR_MTD_VALUE_AFTER_TAX_FREIGHT"
    type: sum
    sql: ${TABLE}.LAST_YEAR_MTD_VALUE ;;
  }
  measure: current_year_ytd_value_after_tax_freight {
    label: "CURRENT_YEAR_YTD_VALUE_AFTER_TAX_FREIGHT"
    type: sum
    sql: ${TABLE}.CURRENT_YEAR_YTD_VALUE ;;
  }
  measure: last_year_ytd_value_after_tax_freight {
    label: "LAST_YEAR_YTD_VALUE_AFTER_TAX_FREIGHT"
    type: sum
    sql: ${TABLE}.LAST_YEAR_YTD_VALUE_AFTER_TAX_FREIGHT ;;
  }
  measure: customers_count {
    label: "CUSTOMERS_COUNT_AFTER_TAX_FREIGHT"
    type: sum
    sql: ${TABLE}.CUSTOMERS_COUNT_AFTER_TAX_FREIGHT ;;
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
  measure: purchase_value_before_tax_lastyear {
    label: "PURCHASE_VALUE_BEFORE_TAX_LASTYEAR"
    type: sum
    sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX_LASTYEAR ;;
  }
  measure: total_sale {
    label: "TOTAL_SALE"
    type: sum
    # hidden: yes
    sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX ;;
  }
  measure: avg_sales {
    label: "AVG_SALES"
    type: number
    sql: ${total_sale} /${total_store};;
  }

  # measure: status {
  #   sql: ${TABLE}.status ;;
  #   html:
  #     <div ="color: black; background-color: lightblue; font-size:100%; text-align:center">"dd"</div>;;
  # }
}
