view: fact_customer_transaction {

# sql_table_name: CDP.FACT_CUSTOMER_TRANSACTION;;
  derived_table: {
    sql: SELECT *,
    DATE_DIFF(DATE_CD, lag(DATE_CD) over (partition by customer_cd order by date_cd), DAY) AS DIFF_DATE
    from `CDP.FACT_CUSTOMER_TRANSACTION`;;
    # sql: select CUSTOMER_CD, DATE_CD, date_diff(DATE_CD, lag(DATE_CD) over (partition by CUSTOMER_CD order by DATE_CD), DAY) AS DIFF_DATE

    #   from `CDP.FACT_CUSTOMER_TRANSACTION` ;;
  }

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
dimension: store_cd {
  label: "STORE_CD"
  type: string
  sql: ${TABLE}.STORE_CD ;;
}
dimension: customer_cd {
  label: "CUSTOMER_CD"
  type: string
  sql: ${TABLE}.CUSTOMER_CD ;;
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
measure: min_date_cd {
  label: "MIN_DATE_CD"
  type: date
  sql: MIN(${date_cd}) ;;
}
measure: purchase_value_before_tax {
  label: "PURCHASE_VALUE_BEFORE_TAX"
  type: sum
  sql: ${TABLE}.PURCHASE_VALUE_BEFORE_TAX ;;
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
measure: count_customer {
  description: "for show visualize frequency"
  label: "COUNT_CUSTOMER"
  type: number
  sql: count(${customer_cd});;
  # html: <div class="vis">
  #     <div class="vis-single-value" style="line-height: 1;font-size: 17px; text-align:center;color:black;" >
  #     </div>
  #   </div> ;;
}
  measure: diff_date {
    label: "DIFF_DATE"
    type: max
    sql: ${TABLE}.DIFF_DATE ;;
  }
  measure: med_diff_date {
    label: "MED_DIFF_DATE"
    type: median
    sql: ${TABLE}.DIFF_DATE ;;
  }
  # sales
  # frequency
  # avg bill size
  # abg basket size
  parameter: line_chart_parameter {
    type: unquoted
    description: "To be used with the Line chart value field"
    allowed_value: {label:"Total of Sales" value: "Sales"}
    allowed_value: {label: "Total of Frequency" value: "Frequency"}
    allowed_value: {label: "Average of bill size" value: "AVG_Bill_Size"}
    allowed_value: {label: "Average of basket size" value: "AVG_Basket_Size"}
  }
  measure: line_chart_value {
    type: number
    description: "To be used with line chart parameter field"
    sql:  {% if line_chart_parameter.parameter_value == "Sales"%}
          ${purchase_value_before_tax}
          {%elsif line_chart_parameter.parameter_value == "Frequency"%}
          ${count_customer}
          {%elsif line_chart_parameter.parameter_value == "AVG_Bill_Size"%}
          ${bill_size}
          {% else %}
          ${basket_size}
          {% endif %} ;;
  }
 }
