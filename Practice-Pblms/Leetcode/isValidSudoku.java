/* PROBLEM LINK -->    https://leetcode.com/problems/valid-sudoku/

                                                VALID SUDOKU    */

// This problem is specifically designed for 9x9 sized grid
class Solution {
    public boolean isValidSudoku(char[][] board) {
      /* 
 *  Track seen digits (1-9) for each of the 9 rows, columns, and 3x3 sub-boxes.
 * - First dimension [9]: Represents the 9 rows, columns, or sub-boxes (indices 0 to 8).
 * - Second dimension [10]: Used as value directly (indices 1 to 9 represent numbers '1'to '9').
 */
        boolean[][] rows =new boolean[9][10];
        boolean[][] cols =new boolean[9][10];
        boolean[][] boxes=new boolean[9][10];
      // uses nested loop to iterate through each cell
        for(int r=0;r<9;r++){
            for(int c=0;c<9;c++){
      // skip if encountered '.' other than number('1' to '9')
                if(board[r][c]=='.') continue;
      // convert char into int value
                int val =board[r][c]-'0';
      // calculate the box index using row,column values
                int boxIndx =(r/3)*3+(c/3);
      // if they already found then return false
            if(rows[r][val] || cols[c][val] || boxes[boxIndx][val]) return false;
     // Mark the digit as seen in the respective row, column, and sub-box
            rows[r][val]=true;
            cols[c][val]=true;
            boxes[boxIndx][val]=true;
            }
        }
        return true;
    }
}
