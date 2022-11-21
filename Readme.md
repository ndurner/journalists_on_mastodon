Journalists on Mastodon
=======================

Introduction
------------
This is a collection of scripts to generate a webpage from the [Journalists on Mastodon and Fediverse](https://docs.google.com/spreadsheets/d/13No4yxY-oFrN8PigC2jBWXreFCHWwVRTftwP6HcREtA/edit?resourcekey=undefined#gid=1320898902) spreadsheet.
Features:
 * clickable hyperlinks to Mastodon profiles
 * cleaned-up data

The result is available [here](https://ndurner.github.io/journalists/journalists.xml).

Requirements
------------
 * Microsoft SQL Server (tested with 2019)

Using
-----
 1. Export the [spreadsheet](https://docs.google.com/spreadsheets/d/13No4yxY-oFrN8PigC2jBWXreFCHWwVRTftwP6HcREtA/edit?resourcekey=undefined#gid=1320898902) to CSV
 1. Create a database named "Journalists"
 1. Use the script "view.sql" to create the view "journalists"
 1. Bulk import the sheet to a table named "Download". Use "nvarchar(max)" as datatype for all columns
 1. Use the script "links.sql" to clean up data and build the profile links
 1. Use the script "xml.sql" to create the XML data that underpins the webpage, save as journalists.xml
 1. Serve journalists.xml, journalists.xsl and [vanilla.css](https://vanillacss.com/) to the web