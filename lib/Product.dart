class Product {
  final int id;
  final int price;
  final String title, description, image;

  Product({this.id, this.price, this.title, this.description, this.image});
}

// list of products
// for our demo
List<Product> products = [
  Product(
    id: 1,
    price: 38814,
    title: "Lenovo Legion 5Pi 15.6\"",
    image: "./assets/images/Item1.png",
    description:
      "Processor\t: Intel Core i7-10750H Processor (2.60GHz, up to 5.00GHz with Turbo Boost, 6 Cores, 12MB Cache)\n" +
        "Operating System\t: Windows 10 Home Single Language 64\n" +
        "Memory\t:16GB(8+8) DDR4 2933MHz SoDIMM\n" +
        "Storage\t: Dummy Hard Disk Drive\n" +
        "Display Type\t: 15.6\" FHD(1920x1080) IPS Anti-glare 300nits 144Hz 5ms Narrow 100%sRGB Non-touch\n" +
        "Graphics\t: NVIDIA GeForce GTX 1650 Ti 4GB GDDR6 128bit\n" +
        "AC Adapter\t: 170W AC Adapter Slim (3pin)-Thailand\n" +
        "Warranty\t: 1 Year Courier or Carry-in\n" +
        "Second Storage\t: 512GB Solid State Drive, M.2 2280, PCIe-NVMe, TLC\n" +
        "Camera\t: No Camera, Microphone\n" +
        "Fingerprint Reader\t: No Fingerprint Reader\n" +
        "Keyboard\t: Backlit 4 Zone RGB Keyboard Black Thai\n" +
        "Wireless\t: Wi-Fi 6 2x2 AX, Bluetooth Version 5.0 or above\n" +
        "Battery\t: 4 Cell Li-Polymer Internal Battery, 60Wh\n" +
        "Bluetooth\t: Bluetooth Version 5.0 or above\n" +
        "Pointing Device\t: Not available",
  ),
  Product(
    id: 2,
    price: 20900,
    title: "HP PAVILION 15 (ULTRA VIOLET)",
    image: "assets/images/Item2.png",
    description:
    "CPU : AMD RYZEN 5 3550H\nRAM : 8 GB DDR4\nSTORAGE : 512 GB SSD\nDISPLAY : 15.6\" FULL HD 144Hz\nVGA : NVIDIA GEFORCE GTX1650 4 GB GDDR5\nOS : WINDOWS 10 HOME",
  ),
  Product(
    id: 3,
    price: 22900,
    title: "Lenovo ideapad Gaming 3",
    image: "assets/images/Item3.png",
    description:
    "CPU : AMD RYZEN 5 4600H\nRAM : 8 GB DDR4 3200MHz\nSTORAGE : 512 GB PCIe/NVMe M.2 SSD\nDISPLAY : 15.6\" FULL HD IPS ANTI-GLARE 120Hz\nVGA : NVIDIA GEFORCE GTX1650 4 GB GDDR6\nOS : WINDOWS 10 HOME",
  ),
  Product(
    id: 4,
    price: 30690,
    title: "Lenovo ideapad Gaming 3",
    image: "assets/images/Item3.png",
    description:
    "CPU : Intel Core i7-10750H\nRAM : 16 GB DDR4 3200MHz\nSTORAGE : 1TB 5400 +256GB PCIe/NVMe M.2 SSD\nDISPLAY : 15.6\" FULL HD IPS ANTI-GLARE 120Hz\nVGA : NVIDIA GEFORCE GTX1650Ti 4 GB GDDR6\nOS : WINDOWS 10 HOME",
  ),
  Product(
    id: 5,
    price: 6990,
    title: "LOGITECH G G915 TKL WIRELESS (WHITE)",
    image: "assets/images/Item4.png",
    description:
    "Switch : GL Tactile Switch\nLighting : RGB\nKeycap Font : English\nConnectivity : Lightspeed Wireless or Bluetooth",
  ),
  Product(
    id: 6,
    price: 2990,
    title: "LOGITECH G G512",
    image: "assets/images/Item5.png",
    description:
    "FEATURES : GX BROWN TACTILE SWITCH",
  ),
  Product(
    id: 7,
    price: 3890,
    title: "LOGITECH G PRO WIRELESS (BLACK)",
    image: "assets/images/Item6.png",
    description:
    "OPTICAL SENSOR : 16000 DPI\nSUPPORT : PC WITH USB PORT",
  ),
  Product(
    id: 8,
    price: 4190,
    title: "LOGITECH G903 16000 DPI WIRELESS HERO",
    image: "assets/images/Item7.png",
    description:
    "OPTICAL SENSOR : 16000 DPI\nSUPPORT : PC WITH USB PORT",
  ),
  Product(
    id: 9,
    price: 3990,
    title: "LOGITECH G502 LIGHTSPEED WIRELESS",
    image: "assets/images/Item8.png",
    description:
    "OPTICAL SENSOR : 16000 DPI\nSUPPORT : PC WITH USB PORT\nHyper-fast scroll wheel\nPOWERPLAY compatible\nOnboard memory\nLIGHTSYNC RGB: 2 zone\nMechanical Button Tensioning System\nZero smoothing/acceleration/filtering",
  ),
  Product(
    id: 10,
    price: 3990,
    title: "LOGITECH GAMING GEAR G933S WIRELESS RGB 7.1 SURROUND WHITE",
    image: "assets/images/Item9.png",
    description:
    "HEADSET RESPONSE : 20 Hz - 20000 Hz\nMIC RESPONSE : 100 Hz - 10000 Hz",
  ),
  Product(
    id: 11,
    price: 4790,
    title: "LOGITECH G G733 LIGHTSPEED WIRELESS (WHITE)",
    image: "assets/images/Item10.png",
    description:
    "HEADSET RESPONSE : 20 Hz - 20000 Hz\nMIC RESPONSE : 100 Hz - 10000 Hz",
  ),
];
