class PortfolioCopy {
  const PortfolioCopy(this.en);
  final bool en;

  String get locale => en ? 'en' : 'ar';
  String get name => en ? 'Mahmoud Hamdy Agamy' : 'محمود حمدي عجمي';
  String get role => en
      ? 'CONTENT CREATOR • VIDEOGRAPHER • EDITOR'
      : 'صانع محتوى • مصور • محرر فيديو';
  String get headline =>
      en ? 'Stories worth\nwatching.' : 'أصنع محتوى\nيستحق المشاهدة.';
  String get intro => en
      ? 'I turn ideas and moments into visual content that catches attention and leaves an impression. From filming to editing, every detail serves the story.'
      : 'أحوّل الأفكار واللحظات إلى محتوى بصري يلفت الانتباه ويترك أثرًا. من التصوير إلى المونتاج، أعمل على كل تفصيلة لتصل الحكاية.';
  String get works => en ? 'My Work' : 'أعمالي';
  String get about => en ? 'About' : 'عني';
  String get contact => en ? 'Contact' : 'تواصل';
  String get reachOut => en ? 'Let’s talk' : 'تواصل معي';
  String get projectCta => en ? 'Let’s create together' : 'خلينا نبدأ مشروعك';
  String get downloadCv => en ? 'Download CV' : 'تحميل السيرة الذاتية';
  String get location =>
      en ? 'Al-Kharj, Riyadh, Saudi Arabia' : 'الخرج، الرياض، السعودية';
  String get available => en ? 'Available for freelance' : 'متاح للعمل الحر';
  String get statsEyebrow => en ? 'GROWING COMMUNITIES' : 'أرقامي على السوشيال ميديا';
  String get statsTitle => en ? 'Content that connects' : 'محتوى يصل لجمهور أكبر';
  String get instagram => 'Instagram';
  String get tiktok => 'TikTok';
  String get followers => en ? 'followers' : 'متابع';
  String get topVideo => en ? 'Top video views' : 'أعلى مشاهدات لفيديو';
  String get likes => en ? 'total likes' : 'إجمالي الإعجابات';
  String get tiktokDetail => en
      ? 'Some of my TikTok videos passed 500K views, and others passed 250K.'
      : 'بعض فيديوهاتي على تيك توك تخطّت ٥٠٠ ألف مشاهدة، وأخرى تخطّت ٢٥٠ ألف مشاهدة.';
  String get worksEyebrow => en ? 'SELECTED VIDEOS' : 'مختارات من أعمالي';
  String get worksTitle => en ? 'Stories in motion' : 'من الفكرة إلى الشاشة';
  String get worksIntro =>
      en ? 'Tap any video to watch.' : 'اضغط على أي فيديو لمشاهدته.';
  String get designWorksEyebrow =>
      en ? 'BRAND & AD DESIGN' : 'تصميم إعلاني وهوية بصرية';
  String get designWorksTitle =>
      en ? 'Design work' : 'تصميمات من أعمالي';
  String get designWorksIntro => en
      ? 'A few brand and advertising designs I created.'
      : 'نماذج من تصميماتي الإعلانية والهويات البصرية.';
  String get viewDesign => en ? 'View design' : 'عرض التصميم';
  String get watch => en ? 'WATCH VIDEO' : 'شاهد الفيديو';
  String get aiVideosEyebrow =>
      en ? 'AI VIDEO CREATION' : 'فيديوهات بالذكاء الاصطناعي';
  String get aiVideosTitle => en ? 'AI videos' : 'فيديوهات AI';
  String get aiVideosIntro => en
      ? 'A selection of videos I created with AI tools.'
      : 'مجموعة من الفيديوهات التي أنشأتها باستخدام أدوات الذكاء الاصطناعي.';
  List<String> get aiVideoTitles => en
      ? [
          'Gemini AI Video',
          'AI Video 2',
          'AI Video 3',
          'AI Video 4',
          'AI Video 5',
        ]
      : [
          'فيديو Gemini AI',
          'فيديو AI ٢',
          'فيديو AI ٣',
          'فيديو AI ٤',
          'فيديو AI ٥',
        ];
  List<String> get aiVideoDescriptions => List.filled(
    5,
    en
        ? 'An original AI-generated video created as part of my creative work.'
        : 'فيديو إبداعي أنشأته باستخدام أدوات الذكاء الاصطناعي.',
  );

  String get previousVideo => en ? 'Previous video' : 'الفيديو السابق';
  String get nextVideo => en ? 'Next video' : 'الفيديو التالي';
  String get closeVideo => en ? 'Close video' : 'إغلاق الفيديو';
  List<String> get videoTitles => en
      ? [
          'Visual Storytelling',
          'A Moment in Motion',
          'From Idea to Frame',
          'Behind the Scenes',
          'On Location',
          'A Story Through My Lens',
        ]
      : [
          'حكاية بالصورة',
          'لحظة في حركة',
          'من الفكرة إلى الكادر',
          'وراء الكواليس',
          'في موقع التصوير',
          'حكاية من خلال عدستي',
        ];
  List<String> get videoDescriptions => en
      ? [
          'A short visual piece shaped through thoughtful framing and editing.',
          'A captured moment brought to life with a focused, flowing edit.',
          'A creative concept translated into a clear visual story.',
          'A closer look at the filming process and the details behind the final cut.',
          'On-location footage edited to bring the atmosphere and story forward.',
          'A showcase of camera work, visual rhythm, and post-production.',
        ]
      : [
          'عمل بصري قصير يجمع بين التكوين المدروس والمونتاج المتقن.',
          'لحظة مصوّرة تتحول إلى حكاية بإيقاع مونتاج سلس.',
          'فكرة إبداعية أقدمها في صورة قصة بصرية واضحة.',
          'نظرة أقرب إلى التصوير والتفاصيل التي تصنع النسخة النهائية.',
          'لقطات من موقع التصوير تبرز الأجواء وتحكي تفاصيل المكان.',
          'استعراض للتصوير والإيقاع البصري ومهارات ما بعد الإنتاج.',
        ];
  String get aboutEyebrow => en ? 'A LITTLE ABOUT ME' : 'حكاية وخبرة';
  String get aboutTitle => en ? 'Meet Mahmoud' : 'عن محمود';
  String get aboutText => en
      ? 'A Media and Public Relations graduate, passionate about creating social media content in different ways and telling stories through visuals. I create end-to-end content, from shaping the idea and filming to editing and delivery.'
      : 'خريج إعلام وعلاقات عامة، شغوف بصناعة محتوى السوشيال ميديا بطرق مختلفة، وصناعة الصورة والكلمة. أعمل على إنتاج محتوى بصري متكامل، من كتابة الفكرة وتصويرها إلى المونتاج والتسليم.';
  String get education => en
      ? "Bachelor's Degree in Media and Public Relations • 2025 • Very Good"
      : 'بكالوريوس إعلام وعلاقات عامة • ٢٠٢٥ • تقدير جيد جدًا';
  String get languages => en
      ? 'Arabic: Native  •  English: Good'
      : 'العربية: اللغة الأم  •  الإنجليزية: جيد';
  List<String> get skills => en
      ? [
          'Videography & photography',
          'Adobe Premiere Pro',
          'CapCut & InShot',
          'Short-form storytelling',
          'Social media content',
          'Color & audio editing',
          'AI creative tools',
        ]
      : [
          'تصوير الفيديو والفوتوغرافيا',
          'Adobe Premiere Pro',
          'CapCut و InShot',
          'كتابة المحتوى القصير',
          'محتوى السوشيال ميديا',
          'تصحيح الألوان والصوت',
          'أدوات الذكاء الاصطناعي',
        ];
  String get projectTitle =>
      en ? 'Graduation project • X Mout' : 'مشروع التخرج • X Mout';
  String get projectText => en
      ? 'A radio and television project. I wrote, filmed and edited it with my team. The project received recognition from Egypt’s Ministry of Youth and Sports at the Youth Media Industries Exhibition, part of the 2025 Egyptian-European Summit. It also tied for third place in Media/Broadcasting at the First Arab Drama Conference.'
      : 'مشروع إذاعي وتلفزيوني: كتبت السيناريو وصورت العمل وشاركْت في المونتاج. حصل المشروع على شهادة تقدير من وزارة الشباب والرياضة في معرض صناعات الإعلام الشبابية ضمن القمة المصرية الأوروبية 2025، كما حصد المركز الثالث بالتساوي في فئة الإعلام والبث بالمؤتمر العربي الأول للدراما.';
  String get contactEyebrow => en ? 'HAVE A PROJECT IN MIND?' : 'عندك فكرة؟';
  String get contactTitle =>
      en ? 'Let’s make it a story.' : 'يلا نحولها لحكاية.';
  String get contactText => en
      ? 'I’d love to hear about your next project.'
      : 'يسعدني أسمع عن مشروعك القادم.';
  String get emailMe => en ? 'Email me' : 'راسلني الآن';
}
