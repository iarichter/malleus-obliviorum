
# Python → PowerShell Type Cheat Sheet

## Basic Types
| Python | Meaning | PowerShell |
|--------|---------|------------|
| int | Whole number | [int] |
| float | Decimal number | [double] |
| str | Text | [string] |
| bool | True/False | [bool] |
| None | Null | $null |

## Collections
| Python | Meaning | PowerShell |
|--------|---------|------------|
| list | Ordered mutable array | @(…) |
| tuple | Immutable list | (no true analog) |
| dict | Key-value | @{ key = value } |
| set | Unique values | HashSet |

## Pandas Types
| Python | Meaning | PowerShell |
|--------|---------|------------|
| DataFrame | Table | PSObject array |
| Series | Column | list of values |
| Index | Row labels | Row numbers |

## Datetime
| Python | Meaning | PowerShell |
|--------|---------|------------|
| datetime | Date+time | [datetime] |
| date | Date | [datetime].Date |
| time | Time | [datetime].TimeOfDay |
| timedelta | Time span | [timespan] |

## Paths
| Python | Meaning | PowerShell |
|--------|---------|------------|
| Path | File/folder object | FileInfo/DirectoryInfo |

## Utility
| Python | Meaning | PowerShell |
|--------|---------|------------|
| range | Sequence | 0..10 |
| enumerate | index+value | for loop with index |
| generator | lazy iterable | pipeline-like |

## Quick Mapping
| PowerShell | Python |
|------------|--------|
| $null | None |
| @(1,2,3) | [1,2,3] |
| @{a=1} | {"a":1} |
| Import-CSV | pd.read_csv() |
| $obj.Name | row["Name"] |
| Where-Object | df[df["col"]==val] |
