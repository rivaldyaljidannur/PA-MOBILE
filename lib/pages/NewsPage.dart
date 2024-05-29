import 'package:flutter/material.dart';
import 'package:skena/pages/DropPage.dart';
import 'package:skena/pages/SavedPage.dart';
import 'package:skena/widgets/bottom_navbar.dart';
import 'package:skena/widgets/showsearch.dart';

class NewsPage extends StatefulWidget {
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HYPEABYSS'),
        centerTitle: true,
        automaticallyImplyLeading: false, // Added this line to remove the back button
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(),
          const Text('Most Hype', style: TextStyle(fontFamily: 'Aroma', fontWeight: FontWeight.bold)),
          const Divider(),
          SizedBox(
            height: 200, // Adjust height as needed
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
                ProductListTile(
                  imageUrl: 'assets/images/yujikaneko2.jpg',
                  title: 'Kunichi Nomura and the TRIPSTER x Vans Authentic',
                  subtitle: '23 December 2023',
                  description: 'Kunichi Nomura is a Japanese writer, actor, radio personality, book editor, interior designer, creative director, and DJ from Tokyo, Japan.',
                  text: """Nomura has worn Vans since he was a child who thought they'd make him a better skater and BMXer, and notes that the Authentic has been his "everyday" for the last 15 years. He's also done consulting work for Vans and has several friends at the company, so it seems only right that he'd eventually get a Vans collaboration. In 2023, Nomura's TRIPSTER — an interior design company he co-founded in 2004 — worked with Vans on a three-pack of Authentics that was a full-circle moment for the creative polymath. "Honestly, I feel like I could have not changed them at all," he laughs. In 2019, I pitched them on the idea of making an Authentic in Japan, but since I wanted to do an American model, they said "let's do the collab in the US." Samples were supposed to be produced by the spring of 2020, but the coronavirus messed everything up. The sample came in late, and it didn't adhere to the specs I wanted at all, so I asked for another one to be made. By this point it was around 2021, and Vans moved their Asian headquarters from Hong Kong to Shanghai, which made a lot of people I was in touch with quit and further slowed the process. The next sample arrived about six months after that, and it still wasn't where I wanted it to be, so we kept going. It took about three and a half years in total to get to this point, so it's crazy to think we were originally planning on dropping the collab sometime in the winter of 2020.""",
                ),
                ProductListTile(
                  imageUrl: 'assets/images/chris.jpg',
                  title: """Chris Chase and the Air Jordan 11 "Bred" for Hypebeast's Sole Mates""",
                  subtitle: '9 December 2023',
                  description: """Chris Chase lives and breathes sneakers — both personally and professionally.""",
                  text: """What's the guy who's hooped in pretty much every shoe known to humankind's personal favorite sneaker? The Air Jordan 11 "Bred." To Chase, Michael Jordan's 11th signature sneaker was pivotal for the Air Jordan line, but, more importantly, it was pivotal to him personally. His half-brother gifted him a pair after a basketball camp, and that moment still sticks with him today. In a nearly hour-long conversation, Chase told Hypebeast about why he thinks brands should still lead with performance and innovation, how casting too wide of a net can hurt the prestige of a product, and why he thinks the Air Jordan 11 has been able to stand the test of time.""",
                ),
                ProductListTile(
                  imageUrl: 'assets/images/rumoryezy.png',
                  title: 'Will There Be a YEEZY Day 2024?',
                  subtitle: '27 May, 2024',
                  description: """Ever since adidas terminated its partnership with Ye (the artist formerly known as Kanye West) at the tail-end of 2022, the German sportswear brand has been working to make up for the colossal amount of lost revenue from its once-lucrative YEEZY collaboration.""",
                  text: """After selling off much of its leftover product (reportedly worth over 1.3 billion USD) over the last year and a half, internet rumblings suggest that the label is preparing its last-ever YEEZY Day sale for next month.

On Tuesday, reports surfaced indicating that adidas planned to proceed with its final release of YEEZY products, with an expansive lineup of roughly 60 SKUs—spanning the 350 v2 and the Foam Runner to the 700v2 and the NSLTD—scheduled to drop from June 3 to 14. The restock's dates quickly became murky, as other sources stated that the sale would instead begin on May 27. Then, adidas pulled all of its YEEZY products from its calendar later that day, according to @brandon1on, leaving many to wonder if the sale will go forward at all.""",
                ),
                // Add more items as needed
              ],
            ),
          ),
          const Divider(),
          Text('More News', style: TextStyle(fontFamily: 'Aroma', fontWeight: FontWeight.bold)),
          const Divider(),
          SizedBox(
            height: 420, // Adjust height as needed
            child: ListView(
              shrinkWrap: true,
              children: const [
                ProductListTile(
                  imageUrl: 'assets/images/beright.jpg',
                  title: """"Be Right Back" Real Quickly in the New Off-White™ Sneaker""",
                  subtitle: '22 May, 2024',
                  description: 'The sneakers pull inspiration from Japanese athletic aesthetics and craftsmanship, with running performance and principles at the core of the design.',
                  text: """Off-White™ is giving “BRB” a whole new meaning. After inundating its Instagram page with a slew of “BRB” teasers – at first remaining ominous and office-themed in nature, spotlighting sticky notes stamped “BRB” – the imprint has unveiled its newest inline footwear offering: a runner dubbed the “Be Right Back” sneaker.However, as for the “Be Right Back” colorway, Off-White™ looks to the hues of New York City’s public transit, dipping the runner in shades of bright blue, yellow and silver in homage to the city’s bus system.Built from a combination of mesh and rubberized leather, the sneakers are stamped with a slew of Off-White™ brand hits – on the heel, tongue and insole – and also introduces a new “Arrow language.”“an invitation to “BE WELL”, the “BRB” facilitates moments of ‘you time’ to get you from where you’ve been to where you’re going,” the brand wrote in an Instagram caption. “the sneaker itself takes design cues from ’90s performance running shoes, parlaying them into an everyday silhouette infused with iconic references.”
                    Take a closer look at the shoes the gallery below.“The sneaker itself takes design cues from ’90s performance running shoes, parlaying them into an everyday silhouette infused with iconic references. exclusive NYC colorway out now with further limited-edition releases inspired by the cities of Miami, Milan and Paris slated for release in the coming weeks,” the label continues.""",
                ),
                ProductListTile(
                  imageUrl: 'assets/images/hoka.jpg',
                  title: """WTAPS Puts Its Spin on Two of HOKA’s Most Popular Models""",
                  subtitle: '24 May, 2024',
                  description: 'Japanese streetwear label WTAPS is joining forces with HOKA',
                  text: """reimagining two of the footwear brand’s best-selling silhouettes: the Anacapa GTX Low and the Ora Luxe Slide. Imbued with WTAPS’ signature military-inspired streetwear aesthetics, the two footwear styles are each offered in “Black” and “Four Leaf Clover” colorways.
                    As a versatile day hike model, the collaborative Anacapa GTX Low retains its original functionalities with a breathable and sturdy build. Its upper boasts a mesh and suede fabrication, topped with TPU overlays as well as a weather-resistant GORE-TEX coating. Its outsoles are integrated with Vibram’s Megagrip technology which prevents slipping even on wet and uneven terrains.
                    As for the Ora Luxe Slide, the sandals retain their purpose for post-run recovery while sporting a tonal new look. WTAPS’ signature cross-bones motif adorns the strap, serving low-key embellishments as well as a nod to its collaborative status.
                    The aforementioned WTAPS x HOKA collaborative styles will be available starting May 24 through WTAPS’ online and offline stores. The HOKA Ora Luxe is set to retail for 90 USD), while the Anacapa Low GTX has a price point of 190 USD).""",
                ),
                ProductListTile(
                  imageUrl: 'assets/images/jordambiru.jpg',
                  title: """The Nike Dunk Low Gets a Timeless “White/Navy” Treatment""",
                  subtitle: '24 May, 2024',
                  description: 'A clean white look arrives.',
                  text: """With the summer season in full swing, it’s time to start getting ready for the inevitable vacation plans and spontaneous beach days. Of course, that also means that it’s time to start breaking out the crisp summer whites.
                        Enter the latest offering of the Nike Dunk Low. While the label has yet to reveal any official information on this colorway’s release, the shoe is dressed in a simple white and navy color scheme, utilizing a smooth leather construction.
                        Its understated look is contrasted with navy Swooshes, laces, and tongue tags while “Nike” is embroidered on the heel in a matching hue. Completing the design is a white midsole paired with a navy rubber outsole.
                        Check out the photos above and stay tuned for more release details on the upcoming Nike Dunk Low “White/Navy” iteration. In case you missed it, the Nike Dunk Low “Rugged Orange” is also dropping soon. The Nike Dunk Low “Rugged Orange” is also dropping soon."""
                ),
                // Add more items as needed
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavbar(
                currentIndex: 0,

      ),
    );
  }
}

class ProductListTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;
  final String text;

  const ProductListTile({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(imageUrl),
                  Text(subtitle, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(description),
                  SizedBox(height: 10),
                  Text(text),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(subtitle),
            Text(description),
          ],
        ),
      ),
    );
  }
}
