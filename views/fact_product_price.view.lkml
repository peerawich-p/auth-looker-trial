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
    dimension: product_cost {
      label: "PRODUCT_COST"
      type: number
      sql: ${TABLE}.PRODUCT_COST ;;
    }
    dimension: product_price {
      label: "PRODUCT_PRICE"
      type: number
      sql: ${TABLE}.PRODUCT_PRICE ;;
    }
    dimension: product_profit {
      label: "PRODUCT_PROFIT"
      type: number
      sql: ${TABLE}.PRODUCT_PROFIT ;;
    }
  }
