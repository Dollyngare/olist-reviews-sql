# Problem Framing

## The brief (informal)
"Our review scores are slipping. Is it the delivery? Find out what's
driving the bad reviews."

## Business question
Do late deliveries cause bad customer reviews, and how much of the
bad-review problem do they explain?

## How I defined the terms
- Late order: delivered after the estimated (promised) delivery date
  (DATEDIFF(delivered, estimated) > 0)
- Bad review: a review score of 1 or 2 stars
- Scope: delivered orders only, with a delivery date recorded

## Data used
- orders: order status and delivery dates (99,441 rows)
- reviews: review scores per order (99,223 rows)
- Joined on order_id

## Questions answered
1. How many delivered orders arrived late?
2. Do late orders get lower review scores?
3. What % of late vs on-time orders get a bad review?
4. What share of all bad reviews come from late orders?

## Out of scope (next steps)
- Which sellers, regions or product categories cause the most late orders
