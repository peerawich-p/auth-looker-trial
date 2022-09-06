view: fact_product_price {
    sql_table_name: CDP.FACT_PRODUCT_PRICE ;;
    dimension: date_cd {
      label: "DATE_CD"
      type: date_time
      sql: ${TABLE}.DATE_CD ;;
    }
    dimension: product_cd {
      label: "PRODUCT_CD"
      type: string
      sql: ${TABLE}.PRODUCT_CD ;;
    }
    measure: product_cost {
      label: "PRODUCT_COST"
      type: sum
      sql: ${TABLE}.PRODUCT_COST ;;
    }
    measure: product_price {
      label: "PRODUCT_PRICE"
      type: sum
      sql: ${TABLE}.PRODUCT_PRICE ;;
    }
    measure: product_profit {
      label: "PRODUCT_PROFIT"
      type: sum
      sql: ${TABLE}.PRODUCT_PROFIT ;;
    }
  }
