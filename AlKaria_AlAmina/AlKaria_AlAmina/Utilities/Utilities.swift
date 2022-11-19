//
//  Utilities.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 07/11/2022.
//

import Foundation

class Utilities {
    
    static var loaderViewTag = 10000
    
    static var baseUrl = "http://dev.safer-kids.net/"
    
    static var STORIES_AND_LESSON = "قصص و عبر مفيدة"
    static var STORIES_AND_LESSON_DESC = "قصص مصورة تأخذك لعالم مليء بالمغامرات و التجارب"
    static var KIDS_GAMES = "تسالي والعاب"
    static var KIDS_GAMES_DESC = "في انتظارك تسال منوعة ، و ألعاب ممتعة."
    static var YOUR_TRIPS = "دون رحلتك"
    static var YOUR_TRIPS_DESC = "شاركنا آراءك...انطباعك..صف مشاعرك لاصدقاءك"
    
    
    static var menu =  [
        MenuModel(image_name: "stories_lesson_icon", title: STORIES_AND_LESSON, message: STORIES_AND_LESSON_DESC),
        MenuModel(image_name: "kids_games_icon", title: KIDS_GAMES, message: KIDS_GAMES_DESC),
        MenuModel(image_name: "your_trip_icon", title: YOUR_TRIPS, message: YOUR_TRIPS_DESC),
    ]
    
    static var gameMenu = [
        GameMenuModel(image_name: "haya_icon", title: "هيا نلون"),
        GameMenuModel(image_name: "puzz_icon", title: "الصورة المبعثرة"),
        GameMenuModel(image_name: "intrus_icon", title: "فصل الألوان"),
        GameMenuModel(image_name: "differences_icon", title: "الاختلافات بين الصور")
    ]
    
    static var partenars =  [
        PartenarModel(name: "جمعية مراكز الأحياء", image: "pic1"),
        PartenarModel(name: "جمعية طاقات الشبابية", image: "pic2"),
        PartenarModel(name: "جمعية البر بشمال مكة", image: "pic3"),
        PartenarModel(name: "جمعية الدعوة بالشرائع", image: "pic4"),
        PartenarModel(name: "جمعية الدعوة والإرشاد بقرى جنوب مكة", image: "pic5"),
        PartenarModel(name: " جمعية الدعوة والإرشاد بمكة", image: "pic6"),
        PartenarModel(name: "جمعية البر بوداي نخلة اليمانية", image: "pic7"),
        PartenarModel(name: "جمعية توفيق الأهلية", image: "pic8"),
        PartenarModel(name: "وقف تفاؤل وأمل لرعاية ذوي الاحتياجات الخاصة", image: "pic9"),
        PartenarModel(name: "مؤسسة آمنة الوقفية - الباسقات", image: "pic10"),
        PartenarModel(name: "جمعية الدعوة والإرشاد بالمعابدة", image: "pic11"),
        PartenarModel(name: "جمعية المعالي النسائية", image: "pic12"),
        PartenarModel(name: "مركز المهاجرات النسائي", image: "pic13"),
        PartenarModel(name: "جمعية المعالي النسائية", image: "pic14"),
        PartenarModel(name: "جمعية يسر للتنمية الأسرية", image: "pic15"),
        PartenarModel(name: "مؤسسة إسعاد الوقفية", image: "pic16"),
        PartenarModel(name: "نادي وريف", image: "pic17"),
        PartenarModel(name: "وقف مداد الخير للرعاية الاجتماعية", image: "pic18"),
        PartenarModel(name: " جمعية أم القرى الخيرية النسائية", image: "pic19"),
        PartenarModel(name: "جمعية الأمل المنشود", image: "pic20"),
        PartenarModel(name: "جمعية أمراض الدم والأورام", image: "pic21"),
        PartenarModel(name: "جمعية الدراسات القرآنية", image: "pic22"),
        PartenarModel(name: "جمعية اتحاد المرشدين السياحيين", image: "pic23"),
        PartenarModel(name: "جمعية البر الخيرية بالجعرانة", image: "pic24"),
        PartenarModel(name: "جمعية البر لقرى جنوب مكة", image: "pic25"),
        PartenarModel(name: "جمعية البيئة هي الدواء", image: "pic26")
    ]
    
}



