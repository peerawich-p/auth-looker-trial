view: a_growth {
  #  DATE_ADD(DATE_CD ,INTERVAL -1 YEAR) AS DATE_CD,
  derived_table: {
    sql:
      WITH
      fix_date AS (
      SELECT
      DATE_ADD(DATE_CD ,INTERVAL -1 YEAR) AS DATE_CD,
      PURCHASE_VALUE_BEFORE_TAX
      FROM `CDP.FACT_CUSTOMER_TRANSACTION`
      )
      SELECT
        DATE_CD,
        PURCHASE_VALUE_BEFORE_TAX
      FROM fix_date
      order by DATE_CD ;;
  }

  dimension: year_current {
    label: "YEAR_CURRENT"
    type: number
    sql: ${TABLE}.YEAR_CURRENT ;;
  }
  dimension: year_previous {
    label: "YEAR_PREVIOUS"
    type: number
    sql: ${TABLE}.YEAR_PREVIOUS ;;
  }
  dimension: date_cd {
    type: date_time
    sql: ${TABLE}.DATE_CD ;;
  }

  dimension: fix_date {
    label: "SALE_LY"
    type: number
    sql: ${TABLE}.fix_date ;;
  }
  measure: purchase_value_before_tax {
    label: "PURCHASE_VALUE_BEFORE_TAX"
    type: sum
    sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX ;;
  }
}
