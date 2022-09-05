view: sale_ly {
  derived_table: {
    sql:
    SELECT ADD_YEARS(datetime 'DATE_CD', -1) as DATE_LY
    FROM `CDP.FACT_STORE_SALES`;;
  }

  dimension: customer_cd {
    label: "CUSTOMER_CD"
    type: string
    sql: ${TABLE}.CUSTOMER_CD ;;
  }
  dimension: date_ly {
    label: "DATE_LY"
    type: string
    sql: ${TABLE}.DATE_LY ;;
  }
  dimension: date_cd {
    label: "DATE_CD"
    type: string
    sql: ${TABLE}.DATE_CD ;;
  }

  dimension: median_diff_date {
    label: "MEDIAN_DIFF_DATE"
    type: number
    sql: ${TABLE}.MEDIAN_DIFF_DATE ;;
  }
  measure: purchase_value_before_tax {
    label: "PURCHASE_VALUE_BEFORE_TAX"
    type: sum
    sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX ;;
  }
}
