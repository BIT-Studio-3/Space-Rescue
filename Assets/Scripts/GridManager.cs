using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;
//using UnityEditor.EditorApplication;

public class GridManager : MonoBehaviour
{

    public List<Sprite> Sprites = new List<Sprite>();        // List of sprites used for tiles
    public GameObject TilePrefab;                            // Prefab for a tile GameObject
    public int GridDimension = 8;                            // Dimension of the grid
    public float Distance = 1.0f;                            // Distance between each block
    private GameObject[,] Grid;                              // 2D array to hold the grid of tiles
    public static GridManager Instance { get; private set; } // Singleton instance of the GridManager

    void Awake(){ Instance = this; Score = 0; } // Initialize score to 0

    float timeLeft = 30.0f;  // Remaining time for the timer


    private int _score;
    public int Score
    {
        get
        {
            return _score;
        }

        set
        {
            _score = value;
            ScoreText.text = _score.ToString();  // Update the score text UI
        }
    }
    public TextMeshProUGUI ScoreText;           // UI element to display the score
    public TextMeshProUGUI timerText;           // UI element to display the timer

    void Start()
    {
        Grid = new GameObject[GridDimension, GridDimension];   // Initialize the grid array
        InitGrid();                                            // Initialize the grid with tiles
    }

    void Update()
    {
        timeLeft -= Time.deltaTime;             // Decrease the remaining time
        timerText.text = timeLeft.ToString();   // Update the timer text UI
        if (timeLeft < 0)
        {
            Debug.Log("Time Has run out");
            UnityEditor.EditorApplication.isPlaying = false; // Stop playing the game in the Unity Editor
            //Application.Quit();                            // Quit the game (for the actual build)
        }
    }

    void InitGrid()
    {
        // Calculate the position offset based on the grid dimensions and distance between tiles
        Vector3 positionOffset = transform.position - new Vector3(GridDimension * Distance / 2.0f, GridDimension * Distance / 2.0f, 0);

        // Iterate through each row and column to create tiles
        for (int row = 0; row < GridDimension; row++)
            for (int column = 0; column < GridDimension; column++)
            {
                // Instantiate a new tile prefab
                GameObject newTile = Instantiate(TilePrefab);

                // Create a list of possible sprites for the current tile
                List<Sprite> possibleSprites = new List<Sprite>();

                // Check if the tile to the left has the same sprite and remove it from the possibleSprites list if it does
                Sprite left1 = GetSpriteAt(column - 1, row);
                Sprite left2 = GetSpriteAt(column - 2, row);

                if (left2 != null && left1 == left2)
                {
                    possibleSprites.Remove(left1);
                }

                // Check if the tile below has the same sprite and remove it from the possibleSprites list if it does
                Sprite down1 = GetSpriteAt(column, row - 1);
                Sprite down2 = GetSpriteAt(column, row - 2);
                if (down2 != null && down1 == down2)
                {
                    possibleSprites.Remove(down1);
                }

                // Get a random sprite from the list of possible sprites and assign it to the tile's sprite renderer
                SpriteRenderer renderer = newTile.GetComponent<SpriteRenderer>();
                renderer.sprite = Sprites[Random.Range(0, Sprites.Count)];

                // Add a Tile component to the new tile and set its position
                Tile tile = newTile.AddComponent<Tile>();
                tile.Position = new Vector2Int(column, row);

                // Set the parent of the new tile to the current transform and position it in the grid
                newTile.transform.parent = transform;
                newTile.transform.position = new Vector3(column * Distance, row * Distance, 0) + positionOffset;

                // Store the new tile in the grid array
                Grid[column, row] = newTile;
            }
    }

    public void SwapTiles(Vector2Int tile1Position, Vector2Int tile2Position)
    {
        // Get references to the game objects and sprite renderers of the tiles being swapped
        GameObject tile1 = Grid[tile1Position.x, tile1Position.y];
        SpriteRenderer renderer1 = tile1.GetComponent<SpriteRenderer>();

        GameObject tile2 = Grid[tile2Position.x, tile2Position.y];
        SpriteRenderer renderer2 = tile2.GetComponent<SpriteRenderer>();

        // Swap the sprites of the two tiles
        Sprite temp = renderer1.sprite;
        renderer1.sprite = renderer2.sprite;
        renderer2.sprite = temp;

        // Check if any matches occur after the swap
        bool changesOccurs = CheckMatches();

        // If no matches occur, swap the sprites back to their original positions
        if (!changesOccurs)
        {
            temp = renderer1.sprite;
            renderer1.sprite = renderer2.sprite;
            renderer2.sprite = temp;
        }
        else
        {
            // If matches occur, keep filling and checking for matches until no more matches are found
            do
            {
                FillBlocks();
            } while (CheckMatches());
        }
    }

    bool CheckMatches()
    {
        // Create a HashSet to store the matched tiles' sprite renderers
        HashSet<SpriteRenderer> matchedTiles = new HashSet<SpriteRenderer>();

        // Iterate through each row and column in the grid
        for (int row = 0; row < GridDimension; row++)
        {
            for (int column = 0; column < GridDimension; column++)
            {
                // Get the sprite renderer of the current tile
                SpriteRenderer current = GetSpriteRendererAt(column, row);

                // Check for horizontal matches for the current tile
                List<SpriteRenderer> horizontalMatches = FindColumnMatchForTile(column, row, current.sprite);
                if (horizontalMatches.Count >= 2)
                {
                    // Add the horizontally matched tiles to the matchedTiles set
                    matchedTiles.UnionWith(horizontalMatches);
                    matchedTiles.Add(current);
                }

                // Check for vertical matches for the current tile
                List<SpriteRenderer> verticalMatches = FindRowMatchForTile(column, row, current.sprite);
                if (verticalMatches.Count >= 2)
                {
                    // Add the vertically matched tiles to the matchedTiles set
                    matchedTiles.UnionWith(verticalMatches);
                    matchedTiles.Add(current);
                }
            }
        }

        // Clear the sprites of the matched tiles and update the score
        foreach (SpriteRenderer renderer in matchedTiles)
        {
            renderer.sprite = null;
        }
        Score += matchedTiles.Count;

        // Return true if there were any matches, otherwise return false
        return matchedTiles.Count > 0;
    }

    List<SpriteRenderer> FindColumnMatchForTile(int col, int row, Sprite sprite)
    {
        List<SpriteRenderer> result = new List<SpriteRenderer>();
        for (int i = col + 1; i < GridDimension; i++)
        {
            SpriteRenderer nextColumn = GetSpriteRendererAt(i, row);
            if (nextColumn.sprite != sprite)
            {
                break;
            }
            result.Add(nextColumn);
        }
        return result;
    }

    List<SpriteRenderer> FindRowMatchForTile(int col, int row, Sprite sprite)
    {
        List<SpriteRenderer> result = new List<SpriteRenderer>();
        for (int i = row + 1; i < GridDimension; i++)
        {
            SpriteRenderer nextRow = GetSpriteRendererAt(col, i);
            if (nextRow.sprite != sprite)
            {
                break;
            }
            result.Add(nextRow);
        }
        return result;
    }

    void FillBlocks()
    {
        // Iterate through each column and row in the grid
        for (int column = 0; column < GridDimension; column++)
            for (int row = 0; row < GridDimension; row++)
            {
                // Check if the current tile has a null sprite
                while (GetSpriteRendererAt(column, row).sprite == null)
                {
                    // Get references to the current and next sprite renderers
                    SpriteRenderer current = GetSpriteRendererAt(column, row);
                    SpriteRenderer next = current;

                    // Shift the sprites from the row above down to fill the empty tile
                    for (int filler = row; filler < GridDimension - 1; filler++)
                    {
                        next = GetSpriteRendererAt(column, filler + 1);
                        current.sprite = next.sprite;
                        current = next;
                    }
                    // Generate a random sprite for the newly filled tile
                    next.sprite = Sprites[Random.Range(0, Sprites.Count)];
                }
            }
    }


    Sprite GetSpriteAt(int column, int row)
    {
        if (column < 0 || column >= GridDimension
            || row < 0 || row >= GridDimension)
            return null;
        GameObject tile = Grid[column, row];
        SpriteRenderer renderer = tile.GetComponent<SpriteRenderer>();
        return renderer.sprite;
    }

    SpriteRenderer GetSpriteRendererAt(int column, int row)
    {
        if (column < 0 || column >= GridDimension
             || row < 0 || row >= GridDimension)
            return null;
        GameObject tile = Grid[column, row];
        SpriteRenderer renderer = tile.GetComponent<SpriteRenderer>();
        return renderer;
    }
}
