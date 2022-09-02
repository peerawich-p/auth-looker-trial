view: fact_customer_transaction {

  sql_table_name: CDP.FACT_CUSTOMER_TRANSACTION;;

  dimension: customer_cd {
    label: "CUSTOMER_CD"
    type: string
    sql: ${TABLE}.CUSTOMER_CD ;;
  }

  dimension: median_diff_date {
    label: "MEDIAN_DIFF_DATE"
    type: number
    sql: ${TABLE}.MEDIAN_DIFF_DATE ;;
  }
  dimension: date_cd {
    label: "DATE_CD"
    type: date_time
    sql: ${TABLE}.DATE_CD ;;
  }
  dimension: date_year_month {
    label: "DATE_YEAR_MONTH"
    type: date_month
    sql: ${TABLE}.DATE_CD ;;
  }
  # dimension: year {
  #   label: "YEAR"
  #   type: number
  #   sql: EXTRACT(YEARS from ${date_cd});;
  # }

  dimension: product_cd {
    label: "PRODUCT_CD"
    type: string
    sql: ${TABLE}.PRODUCT_CD ;;
  }
  dimension: store_cd {
    label: "STORE_CD"
    type: string
    sql: ${TABLE}.STORE_CD ;;
  }

  dimension: channel_cd {
    label: "CHANNEL_CD"
    type: string
    sql: ${TABLE}.CHANNEL_CD ;;
  }
  measure: items {
    label: "ITEMS"
    type: sum
    sql: CAST(${TABLE}.ITEMS as INTEGER);;
  }
  measure: basket_size  {
    label: "BASKET_SIZE"
    type: number
    sql: ${items}/${orders_count}  ;;
  }
  measure: avg_basket_size  {
    label: "AVG_BASKET_SIZE"
    type: number
    sql: ${basket_size}/${orders_count}  ;;
  }
  measure: min_date_cd {
    label: "MIN_DATE_CD"
    type: date
    sql: MIN(${date_cd}) ;;
  }
  measure: purchase_value_before_tax_lastyear {
    label: "PURCHASE_VALUE_BEFORE_TAX_LASTYEAR"
    type: sum
    sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX_LASTYEAR ;;
  }
  measure: purchase_value_before_tax {
    label: "PURCHASE_VALUE_BEFORE_TAX"
    type: sum
    sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX ;;
  }
  measure: total_sale {
    label: "TOTAL_SALE"
    type: sum
   sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX ;;
  }
  dimension: store_size {
    label: "STORE_SIZE"
    type: string
    sql: ${dim_store.store_size} ;;
  }
  dimension: store_size_num {
    label: "STORE_SIZE_NUM"
    type: number
    sql: cast(${store_size} as integer) ;;
  }
  measure: total_area {
    label: "TOTAL_AREA"
    type: sum
    sql: ${store_size_num} ;;
  }
  measure: sale_per_sqm {
    label: "SALE_PER_SQM"
    type: number
    sql: ${purchase_value_before_tax}/${total_area} ;;
  }
  measure: avg_sale_per_sqm {
    label: "AVG_SALE_PER_SQM"
    type: number
    sql:  ${sale_per_sqm}/${count_store};;
  }
  measure: count_store {
    label: "COUNT_STORE"
    type: count_distinct
    sql: ${store_cd};;
  }
  measure: avg_sales {
    label: "AVG_SALES"
    # value_format: "#,##0.00"
    type: number
    sql:  ${purchase_value_before_tax}/${count_store};;
  }
  # measure: total_avg_sales {
  #   label: "TOTAL_AVG_SALES"
  #   # value_format: "#,##0.00"
  #   type: sum
  #   sql:  ${avg_sales};;
  # }
  # measure: totalSales {
  #   label: "TOTAL_SALES"
  #   # value_format: "#,##0.00"
  #   type: sum
  #   sql:  ${purchase_value_before_tax};;
  # }
  measure: sum_avg_sales {
    label: "SUM_AVG_SALES"
    # value_format: "#,##0.00"
    type: number
    sql:  ${avg_sales};;
  }

  measure: custom_sales_visual {
    type: count
    html:
    <div style="border-radius: 10px; background-color: #d3363d; color: #fff;">
        <div style="font-size: 4rem; display: inline-block;">total sales is {{ purchase_value_before_tax }}</div>
        <div style="display: inline-block;">
        <p style="font-size: 1.5rem;"><strong>average of sales is {{ avg_sales }}</strong></p>

      </div>
      </div> ;;
  }
  measure: orders_count {
    label: "ORDERS_COUNT"
    type: sum
    sql: ${TABLE}.ORDERS_COUNT ;;
  }
  measure: bill_size {
    label: "BILL_SIZE"
    type: number
    sql: ${purchase_value_before_tax}/${orders_count} ;;
  }
  measure: avg_bill_size {
    label: "AVG_BILL_SIZE"
    # value_format: "#,##0.00"
    type: number
    sql:  ${bill_size}/${count_store};;
  }
  measure: last_day_purchase_value {
    label: "LAST_DAY_PURCHASE_VALUE"
    type: sum
    sql: ${TABLE}.LAST_DAY_PURCHASE_VALUE ;;
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
  measure: transaction_cost_value {
    label: "TRANSACTION_COST_VALUE"
    type: sum
    sql: ${TABLE}.TRANSACTION_COST_VALUE ;;
  }
  measure: transaction_profit_value {
    label: "TRANSACTION_PROFIT_VALUE"
    type: sum
    sql: ${TABLE}.TRANSACTION_PROFIT_VALUE ;;
  }
  measure: profit_margin {
    label: "NET_PROFIT_MARGIN"
    type: number
    sql: (${transaction_profit_value}/${purchase_value_before_tax})*100 ;;
  }
  measure: avg_margin {
    label: "AVG_MARGIN"
    # value_format: "#,##0.00"
    type: number
    sql:  ${profit_margin}/${count_store};;
  }
  measure: count_customer {
    description: "for show visualize frequency"
    label: "COUNT_CUSTOMER"
    type: count_distinct
    sql: ${customer_cd};;
  }
  measure: diff_date {
    label: "DIFF_DATE"
    type: max
    sql: ${TABLE}.DIFF_DATE ;;
  }

  parameter: measure_selector {
    type: unquoted
    default_value: "revenue"
    allowed_value: {
      label: "Sales"
      value: "sales"
    }
    allowed_value: {
      label: "Frequency"
      value: "frequency"
    }
    allowed_value: {
      label: "AVG  Bill Size"
      value: "avgBillSize"
    }
    allowed_value: {
      label: "AVG Basket Size"
      value: "avgBasketSize"
    }
  }

  measure: dynamic_measure {
    label_from_parameter: measure_selector
    type: number
    sql:
      {% if measure_selector._parameter_value == "sales" %} ${purchase_value_before_tax}
      {% elsif measure_selector._parameter_value == "frequency" %} ${orders_count}
      {% elsif measure_selector._parameter_value == "avgBillSize" %} ${bill_size}
      {% else %} ${basket_size}
      {% endif %};;
    html:
      {% if measure_selector._parameter_value == "sales" %} {{ purchase_value_before_tax._rendered_value }}
      {% elsif measure_selector._parameter_value == "frequency" %} {{orders_count._rendered_value}}
      {% elsif measure_selector._parameter_value == "avgBillSize" %} {{bill_size._rendered_value}}
      {% else %} {{ basket_size._rendered_value }}
      {% endif %} ;;
  }
  dimension: year{
    label: "YEAR"
    type: date_year
    sql: ${TABLE}.date_cd ;;
  }
  dimension: year_current{
    label: "YEAR_CURRENT"
    type: number
    sql: CAST(${year} as INTEGER) ;;
  }
  dimension: year_previous{
    label: "YEAR_PREVIOUS"
    type: number
    sql: ${year_current}-1 ;;
  }
  dimension: month_current {
    label: "MONTH_CURRENT"
    type: number
    sql: EXTRACT(MONTH from ${date_cd});;
    # EXTRACT(MONTH FROM
  }
  dimension: month_previous {
    label: "MONTH_PREVIOUS"
    type: number
    sql: EXTRACT(MONTH from ${date_cd});;
  }
  measure: sale_ly {
    label: "SALE_LY"
    type: sum
    sql: ${purchase_value_before_tax} ;;
    filters: {
      field: year_previous
    }
  }
  # measure: blue_total {
  #   type: sum
  #   sql: ${amount} ;;
  #   filters: {
  #     field: color
  #     value: "blue"
  #   }
  # }
}
