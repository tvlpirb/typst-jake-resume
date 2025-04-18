/* Imports */
#import "metadata.typ": *


/* Utility functions */
#let autoImport(file) = {
    if cvLanguage == "" {
        include {"content/en/" + file + ".typ"}
    }
    else {
        include {"content/" + cvLanguage + "/" + file + ".typ"}
    }
}

#let languageSwitch(dict) = {
    for (k, v) in dict {
        if k == cvLanguage {
            return v
            break
        }
    }
    panic("i18n: language value not matching any key in the array")
}


/* Styling */
#let headerFont = ("Source Sans Pro", "Symbols Nerd Font")
#let textFont = ("Source Sans Pro", "Symbols Nerd Font")

#let textColors = (
    lightGray: rgb("#ededef"),
    mediumGray: rgb("#78787e"),
    darkGray: rgb("#3c3c42"),
)

#let accentColors = (
    burgundy: rgb("#800020"),
)

#let chosenAccentColor = {
    if type(accentColor) == color {
        accentColor
    } else {
        accentColors.at(accentColor)
    }
}

#let divider() = align(center,
    line(length: 95%, stroke: (paint: textColors.mediumGray, dash: "dashed"))
)

#let headerFirstNameStyle(str) = {text(
    font: headerFont,
    size: 28pt,
    weight: "light",
    str
)}

#let headerLastNameStyle(str) = {text(
    font: headerFont,
    size: 28pt,
    weight: "bold",
    str
)}

#let headerInfoStyle(str) = {text(
    font: headerFont,
    size: 9pt,
    str
)}

#let headerQuoteStyle(str) = {text(
    size: 12pt,
    weight: "medium",
    style: "italic",
    fill: chosenAccentColor,
    str
)}

#let entryA1Style(str) = {text(
    size: 12pt,
    weight: "bold",
    str
)}

#let entryA2Style(str) = {align(right, text(
    weight: "medium",
    fill: chosenAccentColor,
    style: "oblique",
    str
))}

#let entryB1Style(str) = {text(
    size: 11pt,
    fill: chosenAccentColor,
    weight: "medium",
    smallcaps(str)
)}

#let entryB2Style(str) = {align(right, text(
    size: 11pt,
    weight: "medium",
    fill: textColors.mediumGray,
    style: "oblique",
    str
))}


#let languageNameStyle(str) = {text(
    size: 12pt,
    weight: "bold",
    str
)}

#let languageInfoStyle(str) = {text(
    str
)}

#let letterHeaderNameStyle(str) = {text(
    fill: chosenAccentColor,
    weight: "bold",
    str
)}

#let letterHeaderAddressStyle(str) = {text(
    fill: textColors.mediumGray,
    size: 0.9em,
    smallcaps(str)
)}

#let letterDateStyle(str) = {text(
    size: 0.9em,
    style: "italic",
    str
)}

#let letterSubjectStyle(str) = {text(
    fill: chosenAccentColor,
    weight: "bold",
    underline(str)
)}

#let letterHeader(
    myAddress: "Your Address Here",
    recipientName: "Recipient Name Here",
    recipientAddress: "Recipient Address Here",
    date: "Today's Date",
    subject: "Subject: Hey!"
) = {
    letterHeaderNameStyle(firstName + " " + lastName)
    v(1pt)
    letterHeaderAddressStyle(myAddress)
    v(1pt)
    align(right, letterHeaderNameStyle(recipientName))
    v(1pt)
    align(right, letterHeaderAddressStyle(recipientAddress))
    v(1pt)
    letterDateStyle(date)
    v(1pt)
    letterSubjectStyle(subject)
    linebreak(); linebreak()
}

#let letterSignature(path) = {
    linebreak()
    place(right, dx:-5%, dy:0%, image(path, width: 25%))
}


/* Layout */
#let layout(doc) = {
    set text(
        font: textFont,
        weight: "regular",
        size: 11pt,
    )
    set par(
        leading: 0.75em,
    )
    set align(left)
    set page(
        paper: "a4",
        margin: (
            left: 1.2cm,
            right: 1.2cm,
            top: .6cm,
            bottom: 1.2cm,
        ),
    )
    doc
}
