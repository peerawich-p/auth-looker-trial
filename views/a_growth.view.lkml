view: a_growth {
  derived_table: {
    sql:
    WITH
    fact_customer_transaction AS (
    SELECT
    PURCHASE_VALUE_BEFORE_TAX
    YEAR_PREVIOUS,
    YEAR_CURRENT,
    STORE_CD,
    PRODUCT_CD,
    FROM `CDP.FACT_CUSTOMER_TRANSACTION`
    ),
    cal_sale_ly AS (
    SELECT
    YEAR_CURRENT,
    YEAR_PREVIOUS,
    PURCHASE_VALUE_BEFORE_TAX WHERE YEAR_CURRENT = YEAR_CURRENT-1 AS SALE_LY,
    FROM fact_customer_transaction
    )

      SELECT
      YEAR_CURRENT,
    YEAR_PREVIOUS,
      PURCHASE_VALUE_BEFORE_TAX
      FROM cal_sale_ly
      ;;
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

  dimension: sale_ly {
    label: "SALE_LY"
    type: number
    sql: ${TABLE}.SALE_LY ;;
  }
  measure: purchase_value_before_tax {
    label: "PURCHASE_VALUE_BEFORE_TAX"
    type: sum
    sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX ;;
  }
}
