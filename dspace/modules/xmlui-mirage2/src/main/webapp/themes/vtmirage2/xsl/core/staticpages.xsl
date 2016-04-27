<xsl:stylesheet xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                xmlns:dri="http://di.tamu.edu/DRI/1.0/"
                xmlns:mets="http://www.loc.gov/METS/"
                xmlns:xlink="http://www.w3.org/TR/xlink/"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:mods="http://www.loc.gov/mods/v3"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:confman="org.dspace.core.ConfigurationManager"
                exclude-result-prefixes="i18n dri mets xlink xsl dim xhtml mods dc confman">

    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

	<xsl:template name="AboutStaticPage">
		<h1>About VTechWorks</h1>
		<p>
			VTechWorks, Virginia Tech's open access institutional repository, publicizes and preserves the scholarly work of Virginia Tech faculty, 
			students, and staff: journal articles, books, theses, dissertations, conference papers, slide presentations, technical reports, working 
			papers, administrative documents, videos, images, data sets, and more. Most content is recent, published within the last 15 years, but 
			there is also a great deal of older and historical content. The full text of all documents is available, often in PDF format, and all 
			entries are indexed by search engines such as Google Scholar and Summon. Any member of the Virginia Tech community can upload material 
			to VTechWorks.
		</p>
		<p>
			VTechWorks supports a hierarchical structure composed of Communities and Collections. Communities include colleges, departments, research 
			centers, institutes, or other entities. Communities contain Collections and sub-communities, and Collections hold the digital works.
			VTechWorks was launched in 2012 and runs on the widely-used DSpace preservation platform. VTechWorks is managed by the Virginia Tech Libraries 
			for the purpose of stewarding the intellectual output of the university in its land-grant mission to serve the Commonwealth of Virginia, 
			the nation, and the world community through the discovery and dissemination of new knowledge.
		</p>
		
		<h1>How VTechWorks benefits researchers</h1>
		<p>
			<ul style="list-style-type:square">
				<li>Research in VTechWorks is widely disseminated, free to anyone in the world with an Internet connection.</li>
				<li>Research in VTechWorks is easily discovered, since it is indexed in Google Scholar, WorldCat, the Virginia Tech website, and the University Libraries' Summon. </li>
				<li>Research in VTechWorks has increased impact: many studies show that openly accessible research is more frequently cited by journalists and scholars than research published in journals and books that must be paid for.</li>
				<li>Research in VTechWorks has a persistent, stable link ("handle") that won't change even when current servers are replaced, which makes it more reliable for others to cite and to share on social media.</li>
				<li>Research in VTechWorks will be preserved by the University Libraries for decades or even centuries, unlike research posted on a personal web page or published by a company that might go out of business.</li>
				<li>Research in VTechWorks is preserved even if a researcher leaves Virginia Tech, but it can always be posted or published elsewhere, since Virginia Tech does not claim any unnecessary or additional rights to the material.</li>
			</ul>
		</p>
	</xsl:template>
	
	<xsl:template name="PoliciesStaticPage">
		<h1>VTechWorks Policies, Procedures, and Guidelines</h1>
		<h2>Content Policies</h2>
		<h3>Criteria for works in VTechWorks </h3>
		<p>
			<ul style="list-style-type:square">
				<li>The work is produced, submitted, or sponsored by Virginia Tech faculty, staff, administrators, alumni, or students.</li>
				<li>The work is related to education, research, service, or extension activities, or the work has historical value to the Virginia Tech community</li>
				<li>
					The author/owner must be willing and able to grant Virginia Tech the non-exclusive right to preserve and provide online access to the work. 
					The authors and copyright owners determine if their works will be in VTechWorks exclusively or will made available through additional online 
					platforms.
				</li>
				<li>
					The complete text, image, audio, or video of the work is stored in VTechWorks, even if the file is not publicly available. VTechWorks is a 
					content repository and does not accept metadata-only records.
				</li>
				<li>The work is appropriate for inclusion in the Collection to which it is submitted.</li>
				<li>The work exists in a recommended file format that will facilitate long-term access and preservation, although any digital format will be accepted.</li>
				<li>If the work is part of a series, other works in the series should also be deposited so that VTechWorks can offer as full a set as possible.</li>
				<li>The work is static content, not a live data stream.  It is not possible to execute files or run software through VTechWorks.</li>
			</ul>
		</p>

		<h3>Types of content in VTechWorks </h3>
		<p>Types of content in VTechWorks include (but are not limited to) 
			<ul style="list-style-type:square">
				<li>Journal articles, pre-prints, and post-prints, i.e., versions of peer-reviewed articles accepted for publication</li>
				<li>Books, including scholarly monographs and textbooks</li>
				<li>Technical reports</li>
				<li>White papers</li>
				<li>Extension materials, e.g., content created by Virginia Cooperative Extension</li>
				<li>Learning objects, e.g., modules, syllabi, lecture videos, etc.</li>
				<li>Presentations, including lecture notes, slides, and videos of scholarly talks</li>
				<li>Posters, e.g., digital files of posters that were presented at conferences or symposia</li>
				<li>Conference proceedings, especially symposia hosted or sponsored by Virginia Tech</li>
				<li>Creative endeavors including media, art, music</li>
				<li>Performances, e.g., audio or video recordings of recitals, dramatic readings, and the like</li>
				<li>Research and statistical data, including surveys, censuses, voting records, field recordings, management plans, etc.</li>
				<li>
					Administrative documents, including policies, rulings, official statements, strategic and operational plans, annual reports, 
					newslettes, and other materials generated by colleges and departments that document the history and intellectual life of Virginia Tech
				</li>
				<li>News articles and press releases produced by University Relations or other Virginia Tech news outlets</li>
				<li>Historical material and primary sources, including historic photographs, manuscripts, and rare books</li>
			</ul> 
		</p>
		<h3>File size guidelines </h3>
		<p>
			VTechWorks does not currently place restrictions on file size or the number of files that can be deposited. However, VTechWorks reserves the 
			right to refuse to ingest materials whose volume would present a strain on its resources. In many cases, grant- or department-funded projects 
			provide a budget for storage, preservation and access; in these cases, VTechWorks may be able to provide more storage for a nominal fee.
		</p>


	</xsl:template>
	
	<xsl:template name="HelpStaticPage">
		<h1>VTechWorks Help</h1>
		<h2>General Help</h2>
		<p>
For help with any and all questions with depositing or accessing VTechWorks content, write VTechWorks Support at <strong><a>			<xsl:attribute name="href"><xsl:text>mailto:vtechworks@vt.edu</xsl:text></xsl:attribute><xsl:text>vtechworks@vt.edu</xsl:text></a></strong>. VTechWorks support staff will help you deposit content yourself or will deposit it for you and will help you access existing work. 		
		</p>
		<h2>What to Deposit</h2>
		<p>
		VTechWorks accepts complete, finished scholarly works created by Virginia Tech faculty, students, and staff: journal articles, conference presentations, dissertations, theses, technical reports, and more. VTechWorks accepts only items that the depositor has the right to deposit, usually because s/he is the creator of the work and has not relinquished to a third party (such as a publisher) the right to post a full copy of the work online. VTechWorks requires that at least one file with the full content of the work be attached to every submission: as a general rule we do not accept metadata-only records, since our purpose is to preserve and provide access to the full text of scholarly works. See the <a href="http://vtechworks.lib.vt.edu/page/policies">Policies</a> page for the full VTechWorks Content Policy.		
		</p>		
		<h2>Who Can Deposit</h2>
		<p>
		Faculty, students, and staff of Virginia Tech will be given permission to deposit their own work -- that is, work they have created and for which they or Virginia Tech own the copyrights. Authorized representatives of particular Virginia Tech units will also be given permission to deposit work on behalf of their unit, and Virginia Tech Libraries faculty, staff, and students are also often given permission to create and add to collections on behalf of various Virginia Tech units (for instance, the Virginia Tech Cooperative Extension). In some cases, people who do not work or study at Virginia Tech may also be given permission to add content: VTechWorks staff will consider such requests on a case by case basis. 
		</p>
		<h2>Right to Deposit</h2>
		<p>	
		If you would like to deposit an item you authored that has been previously published, such as a journal article, you should check your publishing contract to see if you have retained the right to deposit (or “self-archive”) the work in an institutional repository. You can also visit the <a href="http://www.sherpa.ac.uk/romeo/search.php">Sherpa/RoMEO database</a> to find out the deposit policies of your journal or publisher. If you are in doubt as to whether you may deposit a work, write <a href="mailto:vtechworks@vt.edu">vtechworks@vt.edu</a> for a consultation. 
		</p>
		<h2>Registering for an Account</h2>
		<p>
		Currently, you must <a href="https://vtechworks.lib.vt.edu/register">register for a VTechWorks account</a> in order to deposit content, and after you have registered, you must also write <a href="mailto:vtechworks@vt.edu">vtechworks@vt.edu</a> to obtain permission to deposit materials to a particular collection. We hope soon that all Virginia Tech users will be able to log in with their Virginia Tech email address and upload content immediately to the collection of their choice. 
		</p>
		<h2>Choosing a Collection</h2>
		<p>
		VTechWorks is organized around Communities, Sub-Communities, and Collections. Communities in VTechWorks are usually Virginia Tech colleges, institutes, and large organizational units (e.g., the College of Science, the Biocomplexity Institute, and the University Libraries). Sub-Communities are usually Virginia Tech departments (e.g., Computer Science, Religion and Culture, and Entomology). Collections are sets of related content within Communities or Sub-Communities (e.g., Research Articles, Technical Reports, Conference Proceedings). Generally, you will want to ask for permission to upload material to one or more existing collections in your own department. You may also ask VTechWorks Support to create a new collection for a particular conference, course, lab, or project. Write <a href="mailto:vtechworks@vt.edu">vtechworks@vt.edu</a> for permission to add content to a particular collection or to have a new collection created.		
		</p>
		<p>
		Faculty may also choose to have a collection under their own name in the Faculty Research community (e.g., Charles Darwin, Marie Curie, George Washington Carver). VTechWorks staff can assist in cross-listing this content in departmental or institute collections. 
		</p>
		<h2>File Names, Sizes, and Formats</h2>
		<h3>File Names</h3>
		<p>	
		Filenames for documents you deposit must be 50 characters or less, including the file extension (.pdf, .docx, .xlsx, .csv). Filenames may not include spaces or special characters. 
		</p>
		<h3>File Sizes</h3>
		<p>
		VTechWorks has no restrictions on file sizes. However, we do recommend that files over 60Mb (megabytes) be compressed if possible in order to save space and increase ease access for content viewers: PDFs and images in particular can often be optimized for size in a desktop application (such as Adobe Acrobat or Adobe Photoshop) before upload. Files over 2GB (gigabytes) may also be difficult to upload through the web interface: large files can be given to VTechWorks staff on flash drives or hard drives for command-line upload. Write <a href="mailto:vtechworks@vt.edu">vtechworks@vt.edu</a> for help.
		</p>
		<h3>File Formats</h3>
		<p>
		VTechWorks accepts more than 75 common file formats. For text documents, the archival PDF/A format is preferred: in Acrobat Pro, for instance, you can choose File --> Save As Other --> Archival PDF (PDF/A) to save your text in the approved format for long-term preservation. 
		</p>
		<h2>Describing Your Work (Metadata)</h2>
		<p>
		We strongly recommend that you add as much accurate and specific information about your submission as you can, since this will enable others to find it. Different collections and item types may have different fields available in the web submission form. Some tips for the most important fields for all item types: 
		</p>
		<h3>Title</h3>
		<p>
		Enter the title or name of the item. If a title is not provided, create one that appropriately describes the item. <em>Examples: Extended Boolean Information Retrieval, Ossian and the Genres of Culture, Chemistry of Arsenic Removal During Coagulation and Fe-Mn Oxidation</em>
		</p>
		<h3>Author(s)/Creator(s)</h3>
		<p>	
		Enter the name of each author or creator. <em>Examples: Faulkner, William; Einstein, Albert; Lovelace, Ada</em>
		</p>
		<h3>Date</h3>
		<p>
		Enter the date of previous publication or public distribution. A year is required, but month and day are optional. If the item has not been previously published, enter today's date. <em>Examples: 2010, 1969 July 01, 1995 August</em>
		</p>
		<h3>Identifiers</h3>
		<p>
		If the item has any identification numbers or codes associated with it, please enter them. <em>Examples: DOI 10.1056/NEJMoa1510991, URL http://www.johncairns.net/ebook2.htm, ISSN 0272-3638</em>
		</p>
		<h3>Abstract</h3>
		<p>
		Enter a brief summary of the item. Preferred length is a single paragraph or about 300 words, although you may enter an abstract of any length. 		
		</p>
		<h3>Notes</h3>
		<p>
		Any information that you feel could improve users’ ability to discover, understand, and use the publication that doesn’t fit into an existing field in the submission form can go in the “Notes” field. 		
		</p>
		<p>
		More thorough information for metadata professionals can be found in the <a href="http://hdl.handle.net/10919/64779">VTechWorks Metadata Guidelines</a>. 
		</p>					
		<h2>Allowing Others to Read and Reuse Your Work</h2>
		<h3>Licenses</h3>
		<p>
		We strongly recommend that you choose a <a href="https://creativecommons.org">Creative Commons license or mark</a> that will let others know under what conditions they may use your work. Available options in the submission process include: 
		</p>
		<h4>Public Domain - no known copyright</h4>
		<p>
		The Public Domain mark by Creative Commons indicates that neither you nor anyone else currently has rights to the work. Common reasons for a work to be in the public domain include because its copyright has expired, because it was created by a government body, or because it is factual and therefore does not meet the copyright standard for original creative expression. The Public Domain mark is most often appropriate for texts and images published before the early 20th century, government documents, datasets, graphs, and charts.	
		</p>
		<h4>CC0 - no rights reserved</h4>
		<p>
		CC0 ("Creative Commons Zero") enables you to waive your rights in your works and thereby place them as completely as possible in the public domain, so that others may freely build upon, enhance, and reuse your works for any purposes without restriction under copyright or database law.		
		</p>
		<h4>Creative Commons - some rights reserved</h4>
		<p>
		Creative Commons licenses allow you to retain some rights: this option will let you decide and declare whether to allow or refuse permission for commercial uses of your work, whether to allow or refuse permission to modify your work, or whether to allow modifications of your work only on the condition that modifiers also allow others to modify the new work ("ShareAlike").
		</p>
		<h4>No Creative Commons license</h4>
		<p>
		You need not specify a Creative Commons license or mark for the work you are uploading, but in that case, people who find the content online will not know whether or how they are permitted to use, share, redistribute, remix, tweak, and build upon your work.
		</p>						
  </xsl:template>
</xsl:stylesheet>