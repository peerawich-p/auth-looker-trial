view: a_growth {
  # SELECT ... From ... WHERE date > DATEADD(year,-1,GETDATE())
  derived_table: {
    sql:
      SELECT
      YEAR_CURRENT,
      YEAR_PREVIOUS,
      PURCHASE_VALUE_BEFORE_TAX
      FROM cal_sale_ly
      WHERE YEAR_CURRENT = DATEADD(YEAR,-1,YEAR_CURRENT)
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
