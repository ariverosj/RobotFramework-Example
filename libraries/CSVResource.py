import pandas as pd

def  read_csv_and_edit_column(path,column,text):
    """
        Reads a CSV file and adds or overwrites a column with a fixed text value.

        Parameters
        ----------
        path : str
            Path to the CSV file.
        column : str
            Name of the column to add or modify.
        text : str
            Text value to be written into the column for all rows.

        Returns
        -------
        pandas.DataFrame
            The modified DataFrame containing the new or updated column.
    """

    df = pd.read_csv(path,sep=";")
    df[column] = text
    return  df


def csv_should_contain_value(csv, column, expected_value):
    """
        Verifies that a CSV dataset contains a specific column and that all values
        in this column match the expected value.

        Parameters
        ----------
        csv : pandas.DataFrame or array-like
            CSV data to be validated. Can be a pandas DataFrame or data
            convertible to a DataFrame.
        column : str
            Name of the column that must exist in the CSV.
        expected_value : any
            Expected value that all rows in the column must contain.

        Raises
        ------
        AssertionError
            If the column does not exist in the CSV or if not all values in the
            column match the expected value.
    """
    df = pd.DataFrame(csv)

    if column not in df.columns:
        raise AssertionError(f"Column '{column}' not found in CSV")

    if not all(df[column] == expected_value):
        raise AssertionError(
            f"Not all values in column '{column}' are '{expected_value}'"
        )