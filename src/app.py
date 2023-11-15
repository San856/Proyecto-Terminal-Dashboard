import dash
from dash import dcc
from dash import html
from dash.dependencies import Input, Output
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
import dash_daq as daq
import dash_ag_grid as dag
import plotly.io as pio


pio.templates.default = "seaborn"
external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = dash.Dash(__name__)
app.title = 'CO2WSN-Dashboard'

# assume you have a "long-form" data frame
# see https://plotly.com/python/px-arguments/ for more options
df_bar = pd.DataFrame({
    "Fruit": ["Apples", "Oranges", "Bananas", "Apples", "Oranges", "Bananas"],
    "Amount": [4, 1, 2, 2, 4, 5],
    "City": ["SF", "SF", "SF", "Montreal", "Montreal", "Montreal"]
})

fig = px.bar(df_bar, x="Fruit", y="Amount", color="City", barmode="group")
fig2  =  px.scatter ( x = [ 0 ,  1 ,  2 ,  3 ,  4 ],  y = [ 0 ,  1 ,  4 ,  9 ,  16 ])



# Data for the tip-graph
df_tip = px.data.tips()

app.layout = html.Div(

    children=[
    # All elements from the top of the page
    html.Div([

        html.H1(children='IOTWSN-PT', style={'color':'#ffffff'}),

        html.Div(children='''
            Dash: A web application framework for Python.
        '''),

        dcc.Graph(
            id='example-graph',
            figure=fig,
            
        ),

        dcc.Graph(
            id='example-graph1',
            figure=fig,
            style={'width': '28%', 'heigth':'5%', 'display': 'inline-block', 'horizontal-align': 'middle','padding':"2em"}
        ),  
    ]),
    # New Div for all elements in the new 'row' of the page
    html.Div([
        html.H1(children='Hello Dash'),

        html.Div(children='''
            Dash: A web application framework for Python.
        '''),

    ]),

    html.Div([
        daq.Gauge(
            color={"gradient":True,"ranges":{"blue":[-10,10],"green":[10,15],"yellow":[15,27],"red":[27,50]}},
            value=22,
            label='Temperatura Actual',
            showCurrentValue=True,
            max=50,
            min=-10,
        )
    ]),

    html.Div([

        html.Div(children='''
            Grafica de dispersión.
        '''),

        dcc.Graph(
            id='example-scaterplot',
            figure=fig2
        ),  
          
    ]),         

])




# Callback function that automatically updates the tip-graph based on chosen colorscale
@app.callback(
    Output('tip-graph', 'figure'),
    [Input("colorscale-dropdown", "value")]
)
def update_tip_figure(colorscale):
    return px.scatter(
        df_color, x="total_bill", y="tip", color="size",
        color_continuous_scale=colorscale,
        render_mode="webgl", title="Tips"
    )

if __name__ == '__main__':
    app.run_server(debug=True)