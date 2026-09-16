# Valid Sudoku (LeetCode #36)

Java solution to validate a $9 \times 9$ Sudoku board in a single pass using boolean tracking matrices.

---

## 📌 Problem Overview

Validates filled cells on a $9 \times 9$ Sudoku grid according to three rules:
1. Each row must contain digits `1-9` without repetition.
2. Each column must contain digits `1-9` without repetition.
3. Each $3 \times 3$ sub-box must contain digits `1-9` without repetition.

---

## 🧮 Sub-Box Index Calculation

The formula maps any grid coordinate `(r, c)` to its corresponding sub-box index (`0` to `8`):

$$\text{boxIdx} = (r / 3) * 3 + (c / 3)$$

* **`r / 3`**: Determines the horizontal row band (`0` = Top, `1` = Middle, `2` = Bottom).
* **`* 3`**: Scales the band to start at box indices `0`, `3`, or `6`.
* **`c / 3`**: Adds the vertical column offset (`0` = Left, `1` = Center, `2` = Right).

```text
       Cols 0-2     Cols 3-5     Cols 6-8
      +------------+------------+------------+
Rows  |            |            |            |
0-2   |   Box 0    |   Box 1    |   Box 2    |
      +------------+------------+------------+
Rows  |            |            |            |
3-5   |   Box 3    |   Box 4    |   Box 5    |
      +------------+------------+------------+
Rows  |            |            |            |
6-8   |   Box 6    |   Box 7    |   Box 8    |
      +------------+------------+------------+

## ⚡ Complexity Analysis

| Metric                 |     Standard Grid (9x9)          |   Generalized Grid (N x N) |
| :---------             |     :------------------------    |   :----------------------- |
| **Time Complexity**    |     **O(1) - Constant**          |   **O(N²) - Quadratic**    |
| **Space Complexity**   |     **O(1) - Constant**          |   **O(N²) - Quadratic**    |

### **Breakdown**

* **Time Complexity:** 
  * **9x9 Board:** The grid always has 81 cells. Since the loop runs a fixed number of times, the execution time is constant **O(1)**.
  * **N x N Board:** Checking every cell in an N x N matrix requires checking N² cells, resulting in **O(N²)** time.
  * **Per-Cell Operations:** Checking and marking array values takes instant **O(1)** time per cell.

* **Space Complexity:**
  * **9x9 Board:** Allocates three fixed arrays of size 9x10 (270 booleans total), using constant **O(1)** memory.
  * **N x N Board:** Storing numbers for N rows, columns, and boxes requires **O(N²)** memory.
