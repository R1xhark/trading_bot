import logging
import schedule
import time

# Import your custom classes and functions here
from Trading212API import Trading212API
from DataProcessor import DataProcessor
from AIModel import AIModel
from Trader import Trader

# Set up basic logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def main():
    # Initialize your trading API with email, password, and mode ('CFD' or 'Invest')
    trading_api = Trading212API(email='richard@dubny.cz', password='tyna26AB', mode='CFD')

    # Create instances of DataProcessor, AIModel, and Trader
    data_processor = DataProcessor()
    ai_model = AIModel(data_processor)
    trader = Trader(trading_api, data_processor, ai_model)

    # Setting up a schedule to retrain the model every week
    schedule.every().week.do(ai_model.retrain_model)

    # Running the scheduler in a loop
    while True:
        schedule.run_pending()
        # Define your trading logic and account management here
        # For example:
        account_balance = trading_api.check_balance()
        asset = 'AAPL'  # Replace with the asset you want to trade
        risk_parameters = {
            'risk_percentage': 2,  # Replace with your desired risk percentage
            'stop_loss': 0.03,      # Replace with your stop-loss value
            'take_profit': 0.05    # Replace with your take-profit value
        }
        trader.automate_trading(asset, risk_parameters, account_balance)
        time.sleep(1)

if __name__ == "__main__":
    main()
