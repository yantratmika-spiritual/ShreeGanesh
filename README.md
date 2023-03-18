# shreeganesh

A project with configurable, narrow target audience. Hopefully this will be a template for several individual organizations to configure for their own systems.

# Audio Content

## Chanting

- Om Gam Ganapataye Namah
- Om Namo Bhagawate Vasudevaaya
- Om NamaH Shivaaya
- Hare Krishna Hare Krishna Krishna Krishna Hare Hare, Hare Rama..
- Gayatri Mantra
- Shree Raama Jya Raam Jaya Jaya Rama
- Shree Swami Samartha
- Shree Gurudeva Datta
- Digambara Digambara
- Mrutyunjay Mantra
- Sainathaaya Namah
- Buddham Sharanam Gacchami
- Mani Padme Hum
- Vitthala Vitthala
- Rama Krushna Hari
- Ganesha Gayatri
- Vishnu Gayatri
- Shiva Gayatri
- Shakti Gayatri
- Rama Gayatri
- Krishna Gayatri
- Surya Gayatri
- Hanumana Gayatri
- Nava Graha Mantra - 9
- Bhagawat Geeta - 18
- Atharva Shirsha - 3
- Sahasranaama - 6
- Popular ones - 21
- Sahasranaamavali, Ashtottarashata - 6 x 1000 + 6 x 108 (Ganesh, Vishnu, Lalita, Shiva, Dattatreya, Durga)

## Rendering

Audio content is rendered in two modes. Mantras repeated 108 times, others played only once.

# Text:

## Scriptures:

- Marathi Varkari: Dnyaneshari, Dasabodh, Tukaram Gatha, Ekanathi Bhagawat,
- Marathi Datta Sampradaya: Guru Charitra, Charitra pothi.
- Hindi: Ramacharita Manasa
- Upanishad: Original texts, translations if any open source is available
- Geeta: Bhagawad Geeta, Ashtavakra Geeta, Avadhoot Geeta, Uddhav Geeta

## Stotras:

- Stotra Ratnakar scanned complete

## Regional:

- Marathi Aarti
- Hindi Aarti
- .. explore

## Saints:

- Kabeer Das
- Tulsidas complete works
- Meera Bai
- Varkari Bhajan
- Narsi Bhagat

# Ayurveda Section

- Extract and translation from the ayurveda books

# Yogasana

- Images and instructions extracted from the books

# Donation

- QR Code or donation links of popular places

# Expansion opportunities:

- Huge Kannada collection in https://www.vyasaonline.com/

---

# App Layout

## Home:

Notifications and flowing content

- Lunar calendar Tithi today
- Routine flowing notifications, taking the user to his chosen content, planned for today
- More interesting feeds

## Chants:

Properly classified, huge collection of chants, with one favorites section
Properly accessible with routes and parameters, so that we can open any given element by clicking on the notification

- Mantras - playing in two modes: infinite / 108 repeat
- Namavali - play once
- Bhagawad Geeta - Play List, Play once
- Chosen Stotra - Play List, Play once

## Darshan

Huge collection of images from different places across the country

- Flowing updates of Daily Darshan images and videos
- Flowing updates of one time darshan images from newly discovered temples

## Swadhyaya

Huge collection of open source scriptures for users to study. Each scripture has scrollable content divided into sections, each with an independent resume info.

## Satsanga

Huge collection of YouTube videos of different sources,

- Continuously flowing, and accumulating content
- Content classified by artist and topic
- App tracks the most viewed artists for the user and notifies when a new video from the same artist
- A favorites section, and a recent section
- Includes the popular serials and archives

## Routine

Allow the user to define a routine.

- A default, suggested routine, that the user can configure as per convinience.
- Morning alarm
- Chosen morning chant
- Configurable "reminder" every "N" minutes
- A checklist for the user to answer for himself. This will show up as the last notification for the day.
- Finally chant - yad yad karma karomi tad tad akhilam, Shambho tavaaraadhanam, or naraayanaaya iti samarpayaami - discover this based on the tendency of the user

## Drawer

- NarayaNaaya Iti Samarpayami
- Advertising ThinkPro Systems

---

# Implementation

## Home

- Flutter component that subscribes to notifications and displays them [V1]
- Different types of notifications, appear as different widgets based on the content [V1]
- Some display only notifications - tithi, Kabeer Doha, Darshan. These are pushed by cloud [V1]
- Develop SAAS that manages publishing notifications [V2]
- For others, On click, jump to the particular component on the other routes [V1]
- These notifications could be internal, based on timer, or external, based on input from the cloud [V1]
- In the cloud, subscribe to YouTube and Twitter for content, then push it to the App [V1]
- Develop own Telegram bot to forward images and other contents to the bot [V2]
- A button to allow users to share their own content [V3]

## Chants

- A heading, with the line "Kaliyuga Kevala Naama Adhaara, Sumira Sumira Nara Utarahi Paara" [V1]
- List of Icon Buttons - Favorites, Mantra, Bhagawad Geeta, [Vividha Stotra, Namavali] [V1]
- On click of each of these buttons, another list of icon buttons that play the real content [V1]
- On click, dark screen, with number count. [V1]
- More content in future versions [V2] [V3]

## Darshan

- App collects and stores the list of image and video IDs [V1]
- These are pulled in by API or pushed by notifications [V1]
- One notification, it pulls the image and saves the ID locally. [V1]
- The Darshan includes an image and a basic writeup about the temple [V1]
- Infinite scroll widget showing these details [V1]
- Users can interact with these images [V2]
- Based on user interaction, show notification when those images are available [V2]
- Users can provide photographs of their own temples [V3]

## Swadhyaya

- A banner glorifying the importance of study [V1]
- List of buttons for the different scriptures [V1]
- A widget for reading the scripture, with defined and custom bookmarks [V1]
- Initial basic set of scriptures - Stotras, Geeta, Ramayan, Dnyaneshwari, Dasbodh. [V1]
- More Stotras, Tukaram Gatha, Ekanathi Bhagawat [V2]
- More scriptures [V3]

## Satsang

- Sata sangati saba mangala moolaa. Virtual satsang for today's world [V1]
- Two parts of the screen, top continuous flowing stream of new videos [V1]
- Lower, buttons with classified old videos [V1]
- Filter the top videos list and show only those that the user likes, rest will silently go into the archives [V2]
- Increase the collection and video sources [V3]

## Routine

- Typical Things to do [V1]
- L2/L3 Dropdown to choose the activities from those provided in the app [V1]
- One suggested routine to start with [V1]
