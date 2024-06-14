## E Commerce Analysis Dashboard

This section provides a detailed guide on setting up and using the Power BI dashboards created for the E-Commerce Data Analytics Project. Follow the steps below to connect to the dataset, create visualizations, and interact with the dashboards to gain insights into sales and net profit.

### Dashboard Link : https://app.powerbi.com/groups/me/reports/caafebd7-5d0a-48aa-bb36-38863292ae51/0af890d8e46708602895?experience=power-bi&bookmarkGuid=a402f9fac498fa6893c5

### Setup and Data Connection

1. **Create a View in MySQL**:
   - Ensure your dataset is available in MySQL and create a view for the dataset you wish to analyze.

2. **Connect Power BI to MySQL**:
   - Open Power BI Desktop.
   - Click on `Get Data` > `More` > `Database` > `MySQL Database`.
   - Enter your server and database details. For the database, specify the schema name.
   - Tick the view you created in MySQL to load the data into Power BI.

### Dashboard 1: Sales and Net Profit Analysis

#### Step-by-Step Creation

1. **Create Cards for Key Metrics**:
   - **Total Sales Value**: Display the total sales in monetary terms.
   - **Count of Unique Orders**: Show the count of unique orders.
   - **Average Value per Order**: Use the following DAX expression:
     ```DAX
     Average Sales Value per Order = 
     SUM('classicmodelss sales_data_for_power_bi'[cost_of_sales]) / 
     DISTINCTCOUNT('classicmodelss sales_data_for_power_bi'[orderNumber])
     ```

2. **Create Country Groups**:
   - Click on `Office Country` and create a group:
     - **Group 1**: Contains only the USA.
     - **Group 2**: Named "Rest of the World", contains all other countries.

3. **Create Line Charts**:
   - **Sum of Sales Value by Order Date**: Add a line chart showing the sum of sales value over time.
   - **Number of Orders by Order Date**: Add a line chart displaying the count of orders over time.
   - **Average Sales Value per Order**: Add a line chart for the average sales value per order over time.
   - Use the `Office Country Group` as the legend for all three charts.
   - In the `Order Date` axis, retain only `Year`, `Quarter`, and `Month`.

4. **Create Toggle Buttons for Sales and Net Profit**:
   - In the table view, create a table with columns `Number ID` and `Control`:
     - Assign `1` for Sales and `2` for Net Profit.
   - Insert two buttons named `Sales` and `Net Profit` with a pill shape.
   - Use the following DAX expression to enable toggling:
     ```DAX
     Selected Metric = 
     SWITCH(
       SELECTEDVALUE('Table'[Number Id]), 
       1, SUM('classicmodelss sales_data_for_power_bi'[sales_value]),
       2, SUM('classicmodelss sales_data_for_power_bi'[sales_value]) - SUM('classicmodelss sales_data_for_power_bi'[cost_of_sales]),
       SUM('classicmodelss sales_data_for_power_bi'[sales_value])
     )
     ```
   - Create a slicer and add the `Control` column from the table.
   - Create bookmarks named `Select 1` (for Sales) and `Select 2` (for Net Profit):
     - Uncheck `Display`, `Current Page`, and `All Visuals`.
     - Check `Selected Visuals`.
     - Hide the slicer.
     - Assign `Select 1` to the `Sales` button and `Select 2` to the `Net Profit` button.

5. **Create Additional Visuals**:
   - **Stacked Bar Chart**: Show Sales/Net Profit by Office Country.
   - **Scatter Chart**: Display Sum of Cost of Sales or Net Profit.
   - **Stacked Column Chart**: Show countries with the highest order count.
   - **Donut Chart**: Visualize Office Country by Sales/Net Profit value.

6. **Add Conditional Titles to Charts**:
   - Click on each chart.
   - Turn on the title.
   - In the text field, click `fx`.
   - Base the title on `Table 1 Control`.

7. **Add Slicers**:
   - **Order Date Slicer**: Use this to filter charts by order date.
   - **Product Name Slicer**: Use this to filter charts by product name.

### Dashboard 2: Net Profit Decomposition and Sales Overview

#### Step-by-Step Creation

1. **Create a New Page**:
   - Add a new page to the Power BI report.

2. **Create a Decomposition Tree**:
   - Display Net Profit broken down by Customer Country, Product Line, and Customer Name.

3. **Create a Sales Overview Table**:
   - Include columns for Year, Month, Sales Value, Month-over-Month Change, and Year-to-Date Sales Value.
   - Add Order Date to the table, retaining only Year and Month.

4. **Calculate Month-over-Month Change and Year-to-Date Total**:
   - Select `Sales Value` metric.
   - Click `Create Quick Measure` and choose the desired calculation.
   - For Month-over-Month change, ensure the result is in percentage format:
     - Go to Model View.
     - Select `MoM`.
     - Set the format to `Percentage` with two decimal places.

5. **Add Page Navigation Buttons**:
   - Create buttons named `Page 1` and `Page 2`.
   - Place the buttons on their respective pages.
   - Enable navigation by turning on the action for the buttons and setting the type to `Page Navigation`.
   - Specify the destination page for each button.
   - To use the buttons, hold `Ctrl` and click.

# Snapshot of Dashboard (Power BI Service)

![E Commerce Project 1st page](https://github.com/pradeeshculer/E-Commerce-Analysis/assets/115096109/30b374ef-2a55-428d-8b48-380688c2896c)

![E Commerce Project 2nd page](https://github.com/pradeeshculer/E-Commerce-Analysis/assets/115096109/933822bc-befd-43a7-94c8-5a213a42841f)


### Conclusion

These Power BI dashboards provide a comprehensive analysis of your e-commerce data. Follow the setup steps and interact with the various visualizations and filters to extract meaningful insights and make data-driven decisions.

