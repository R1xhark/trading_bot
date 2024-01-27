# test_script.py
from ..src.Trading212API import Trading212API
from ..src.DataProcessor import DataProcessor
from ..src.AIModel import AIModel
from ..src.Trader import Trader

def test_trading():
    # Initialize your trading API with test credentials and mode
    trading_api = Trading212API(email='test@example.com', password='testpassword', mode='CFD')

    # Create instances of DataProcessor, AIModel, and Trader
    data_processor = DataProcessor()
    ai_model = AIModel(data_processor)
    trader = Trader(trading_api, data_processor, ai_model)

    # Perform some test trading operations
    account_balance = trading_api.check_balance()
    asset = 'AAPL'
    risk_parameters = {
        'risk_percentage': 2,
        'stop_loss': 0.03,
        'take_profit': 0.05
    }
    trader.automate_trading(asset, risk_parameters, account_balance)

if __name__ == "__main__":
    test_trading()
