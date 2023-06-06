// new module header

struct Collection {
  String name;
  int quantity;
  float price;
  float averageprice;
  import void SetItem(String ItemName, int Quanta, float Price, float AvgPrice);
  import void UpdateMarketGUI(int ItemNumber);
  import void UpdateInventoryGUI(int ItemNumber);
  import void UpdateDepotGUI(int ItemNumber);
};

void Collection::SetItem(String ItemName, int Quanta, float Price, float AvgPrice)
{
  this.name = ItemName;
  this.quantity = Quanta;
  this.price = Price;
  this.averageprice = AvgPrice;
}

void Collection::UpdateMarketGUI(int ItemNumber)
{
  gTMList.Items[ItemNumber] = this.name;
  gTMPrice.Items[ItemNumber] = String.Format("%.2f", this.price);
  if (gTMPrice.Items[ItemNumber] == "inf") {
    this.price = this.averageprice;
    gTMPrice.Items[ItemNumber] = String.Format("%.2f", this.price);
  }
}

void Collection::UpdateInventoryGUI(int ItemNumber)
{
  gTIList.Items[ItemNumber] = this.name;
  gTIQuant.Items[ItemNumber] = String.Format("%i", this.quantity);
  gDPInv.Items[ItemNumber] = this.name;
  gDPInvQuant.Items[ItemNumber] = String.Format("%i", this.quantity);
}

void Collection::UpdateDepotGUI(int ItemNumber)
{
  gDPList.Items[ItemNumber] = this.name;
  gDPQuant.Items[ItemNumber] = String.Format("%i", this.quantity);
}

struct MarketPrice {
  float Prices[9];
  import void UpdatePrices(float InPrices[]);
  import void UpdatePricesList(float Price1, float Price2, float Price3, float Price4, float Price5, float Price6, float Price7, float Price8, float Price9);
};

void MarketPrice::UpdatePrices(float InPrices[])
{
  for (int iPrice = 0; iPrice < 9; iPrice++)
  {
    this.Prices[iPrice] = InPrices[iPrice];
  }
}

void MarketPrice::UpdatePricesList(float Price1, float Price2, float Price3, float Price4, float Price5, float Price6, float Price7, float Price8, float Price9)
{
  this.Prices[0] = Price1;
  this.Prices[1] = Price2;
  this.Prices[2] = Price3;
  this.Prices[3] = Price4;
  this.Prices[4] = Price5;
  this.Prices[5] = Price6;
  this.Prices[6] = Price7;
  this.Prices[7] = Price8;
  this.Prices[8] = Price9;
}

import function UpdateMarketPrice(float Modifier);
import function UpdateATM();
import Collection Inventory[9];
import Collection Market[9];
import Collection Deposit[9];
import String KryptoNames[9];
import MarketPrice AverageMarketPrices[6];
import float max(float a,  float b);
import float min(float a,  float b);
