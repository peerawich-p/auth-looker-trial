connection: "cdp"
label: " CDP Dashboard"
include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#

explore: fact_store_sales {
  label: "FACT_STORE_SALES"
  join: dim_date {
    relationship: many_to_one
    sql_on: ${fact_store_sales.date_cd} = ${dim_date.date_cd} ;;
  }

  join: dim_store {
    relationship: many_to_one
    sql_on: ${fact_store_sales.store_cd} = ${dim_store.store_cd} ;;
  }
}
