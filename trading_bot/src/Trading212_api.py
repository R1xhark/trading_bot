

class Trading212API:
    def __init__(self,api_key):
        self.api_key = api_key

    
    def place_order(self, order_details):
        """
        Place an order on Trading 212.
        :param order_details: dict containing details of the order like asset, amount, buy/sell, etc.
        :return: Response from the API (success/failure)
        """

        pass

    def check_balance(self):
        """
        Check the account balance.
        :return: Account balance
        """
        pass
    def get_marget_data(self,asset):
         """
        Fetch market data for a given asset.
        :param asset: Asset for which to get the data
        :return: Market data
        """
         
        pass
