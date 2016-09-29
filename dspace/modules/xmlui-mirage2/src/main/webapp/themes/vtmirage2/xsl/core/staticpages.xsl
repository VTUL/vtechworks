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
			VTechWorks, Virginia Tech's open access institutional repository, publicizes and preserves the scholarly work of Virginia Tech faculty, students, and staff: journal articles, books, theses, dissertations, conference papers, slide presentations, technical reports, working papers, administrative documents, videos, images, datasets, and more. Most content is recent, published within the last 15 years, but there is also a great deal of older and historical content. The full text of all documents is available, often in PDF format, and all entries are indexed by search engines such as Google Scholar and Summon. Any member of the Virginia Tech community can upload material to VTechWorks.
		</p>
		<p>
			VTechWorks supports a hierarchical structure composed of Communities and Collections. Communities include colleges, departments, research centers, institutes, or other entities. Communities contain Collections and sub-communities, and Collections hold the digital works.	VTechWorks was launched in 2012 and runs on the widely-used DSpace preservation platform. VTechWorks is managed by the Virginia Tech Libraries for the purpose of stewarding the intellectual output of the university in its land-grant mission to serve the Commonwealth of Virginia, the nation, and the world community through the discovery and dissemination of new knowledge.
		</p>
		
		<h1>How VTechWorks benefits researchers</h1>
		<p>
			<ul style="list-style-type:square">
				<li>Research in VTechWorks is widely disseminated, free to anyone in the world with an Internet connection.</li>
				<li>Research in VTechWorks is easily discovered, since it is indexed in Google Scholar, WorldCat, the Virginia Tech website, and the University Libraries' Summon. </li>
				<li>Research in VTechWorks has increased impact: many studies show that openly accessible research is more frequently cited by journalists and scholars than research published in journals and books that must be paid for.</li>
				<li>Research in VTechWorks has a persistent, stable link to the item record ("handle") that won't change, which makes it more reliable for others to cite and to share on social media.</li>
				<li>Research in VTechWorks will be preserved by the University Libraries for decades or even centuries, unlike research posted on a personal web page or published by a company that might go out of business.</li>
				<li>Research in VTechWorks is preserved even if a researcher leaves Virginia Tech, but it can always be posted or published elsewhere, since Virginia Tech does not claim any unnecessary or additional rights to the material.</li>
			</ul>
		</p>
	</xsl:template>
	
	<xsl:template name="PoliciesStaticPage">
<h1>VTechWorks Policies</h1>

<h2>General Content Policies</h2>

<p>Content in VTechWorks must as a rule meet the following criteria, although exceptions can be granted. Write <a href="mailto:vtechworks@vt.edu">vtechworks@vt.edu</a> to discuss exceptions.</p>

<ul>
<li>The work is produced, submitted, or sponsored by Virginia Tech faculty, staff, administrators, alumni, or students.</li>
<li>The work is related to education, research, service, or extension activities, or the work has historical value to the Virginia Tech community.</li>
<li>The author/owner must be willing and able to grant Virginia Tech the non-exclusive right to preserve and provide online access to the work.</li>
<li>The complete text, image, audio, or video of the work is stored in VTechWorks, even if the file is not publicly available. VTechWorks is a content repository and does not accept metadata-only records. </li>
<li>The work is appropriate for inclusion in the Collection to which it is submitted. </li>
<li>The work exists in a recommended file format that will facilitate long-term access and preservation, although any digital format will be accepted. </li>
<li>If the work is part of a series, other works in the series should also be deposited so that VTechWorks can offer as full a set as possible.</li>
<li>The work is static content, not a live data stream.  It is not possible to execute files or run software through VTechWorks.</li>
</ul>

<h2>Types of Content Allowed</h2>

<p>In general, content in VTechWorks is meant to capture the intellectual output of Virginia Tech in all its variety. Types of content in VTechWorks include (but are not limited to) the following: </p>

<ul>
<li>Journal articles, pre-prints, and post-prints, i.e., versions of scholarly and peer-reviewed articles accepted for publication </li>
<li>Books, including scholarly monographs and textbooks</li>
<li>Theses, dissertations, and other student works</li>
<li>Technical reports and white papers</li>
<li>Presentations, including lecture notes, slides, and videos of scholarly talks</li>
<li>Posters, e.g., digital files of posters that were presented at conferences or symposia</li>
<li>Conference proceedings, especially symposia hosted or sponsored by Virginia Tech</li>
<li>Extension materials, e.g., content created by Virginia Cooperative Extension</li>
<li>Learning objects, e.g., modules, syllabi, lecture videos, etc., especially when deposited for preservation purposes</li>
<li>Creative endeavors including media, art, and music</li>
<li>Performances, e.g., audio or video recordings of recitals, dramatic readings, and the like</li>
<li>Patents and other intellectual property documents</li>
<li>Administrative documents, including policies, rulings, official statements, strategic and operational plans, annual reports, newsletters, and other materials generated by colleges and departments that document the history of Virginia Tech</li>
<li>News articles and press releases produced by University Relations or other Virginia Tech news outlets</li>
<li>Data that supports a particular thesis, dissertation, report, article, or book may be deposited in VTechWorks along with that piece of writing as part of a single item record with multiple files. Independent data sets should be deposited in Virginia Tech’s data repository.</li>
</ul>

<h2>Types of Content Not Allowed</h2>

<p>Content that is generally not appropriate for VTechWorks includes the following: </p>

<ul>
<li>Primary sources such as historical images (unless related to the history of Virginia Tech).</li>
<li>Data sets that are published independently for reuse by other researchers as a separate publication; such data may be deposited in Virginia Tech’s data repository at <a href="http://data.lib.vt.edu">http://data.lib.vt.edu</a>. However, data that supports a particular thesis, dissertation, report, article, or book may be deposited in VTechWorks along with that piece of writing as part of a single item record with multiple files.</li>
<li>Material not produced by a member of the Virginia Tech community. One notable exception is the Networked Library of Theses and Dissertations, which contains theses and dissertations produced at institutions around the world which have no digital repository of their own.</li>
<li>Content that contains sensitive, confidential, or personally identifiable information (PII). Such information includes, but is not limited to, names of research participants, birthdates, addresses, social security numbers, and the like. Depositors must ensure that all content submitted to VTechWorks is fully anonymized or scrubbed of sensitive, confidential, or personally identifiable information prior to deposit.</li>
<li>Abstract or citation-only records. VTechWorks is a full-text repository whose purpose is to expand open access to scholarship. Although VTechWorks may have accepted abstracts or citation-only items in the past, VTechWorks will now only accept content in its entirety (e.g., full-text articles, full-text books or book chapters, complete presentations).</li>
<li>Content whose text is not searchable or machine-readable. For textual content to be discovered through VTechWorks, as well as through search engines such as Google and Google Scholar, it must have undergone Optical Character Recognition (OCR), which is the transformation of images of text into machine-readable text.</li>
<li>Works that the depositor does not have the legal right to deposit.</li>
</ul>

<h2>Copyright, Delegates, and Licensing</h2>

<ul>
<li>It is the responsibility of the depositor to ensure that s/he has the legal right to deposit a work in VTechWorks under the terms of <a href="http://www.copyright.gov/title17/">U.S. copyright law</a> and under the terms of any existing contracts related to the work. In general, though there may be exceptions, authors of a work automatically own copyright in that work once it exists in a fixed form, but as a condition of publication many journals, publishers, and conference proceedings make contractual restrictions on which version of a published work can be deposited in an institutional repository such as VTechWorks. <b>Authors should therefore not assume that they have the right to deposit their own published work in VTechWorks.</b> See <a href="http://vtechworks.lib.vt.edu/page/help">http://vtechworks.lib.vt.edu/page/help</a> for help with deposit rights.</li>
<li>Virginia Tech faculty and students own copyright in the works they have created as described in VT Policy 13000, available at <a href="http://www.policies.vt.edu/13000.pdf">http://www.policies.vt.edu/13000.pdf</a>. According to this policy, for “the traditional results of academic scholarship, i.e., textbooks, literary works, artistic creations and artifacts” -- that is, the kinds of works most commonly deposited  in VTechWorks -- “the IP rights remain with the author(s)” and is not claimed by Virginia Tech. However, if VT authors transfer or relinquish their copyrights to third parties, VT authors might no longer have the right to deposit their own published works in VTechWorks.</li>
<li>In general, for a work with multiple authors, every author owns the copyright to the entire work and therefore may deposit the work in VTechWorks without needing to ask permission of the work’s other authors.</li>
<li>Virginia Tech itself owns the copyright in most administrative documents produced by Virginia Tech staff in the normal course of their duties (e.g., reports, policies, news releases); the individual staff member does not usually own the copyright to such material. Such material may be deposited in VTechWorks by any member of the Virginia Tech community.</li>
<li>Authors may ask others to deposit works in VTechWorks on their behalf, and these depositors shall be considered delegates (proxies) for the author. VTechWorks staff and Virginia Tech librarians are de facto delegates for any and all members of the Virginia Tech community.</li>
<li>Delegates who deposit content on behalf of authors should make every effort to determine whether the work can legally be deposited in VTechWorks.</li>
<li>All depositors must agree to the non-exclusive distribution license given below before VTechWorks will host their works. This license grants Virginia Tech the right to host the work without affecting the author’s right to host the work elsewhere.</li>
<li>Copyright owners and their delegates may also elect to license their work with a <a href="http://creativecommons.org">Creative Commons</a> license so that members of the public who find the work online can copy it under certain conditions.
<ul>
<li>Copyright owners may also donate their work to the public domain in perpetuity by giving it a <a href="https://creativecommons.org/publicdomain/zero/1.0/">“CC0 1.0 Universal”</a> mark. The CC0 1.0 Universal mark means that you give up your copyrights to the work for all time. This option is available as part of the submission process. According to the text of the CC0 1.0 Universal mark, which can be found on the <a href="https://creativecommons.org/publicdomain/zero/1.0/">Creative Commons website</a>, assigning the CC0 1.0 Universal mark to your work allows users to “copy, modify, distribute and perform the work, even for commercial purposes, all without asking [your] permission.”
<ul>
<li>Placing content in the <a href="https://wiki.creativecommons.org/wiki/Public_domain">public domain</a> via CC0 1.0 Universal does not mean that you are simply making the item public; there are <a href="https://creativecommons.org/licenses/">several Creative Commons licenses</a> that allow you to make your item public while retaining some or all of your rights under copyright law; you can explore these licenses in greater detail on the Creative Commons’ website.</li>
</ul>
</li>
<li>Some works, such as older publications, federal government documents, or strictly factual data, might already be in the public domain and therefore have no copyright owner; such works can be given the <a href="https://creativecommons.org/publicdomain/mark/1.0/">“Public Domain Mark”</a> by the depositor.</li>
</ul>
</li>
<li>All these and other policies apply to content directly deposited to VTechWorks, to content ingested into VTechWorks via other systems, and to content automatically harvested from other content providers.</li>
<li>For more information about copyright and fair use, please visit the United States Copyright Office’s website at <a href="www.copyright.gov">www.copyright.gov</a>.</li>
</ul>

<h2>VTechWorks Distribution License</h2>

<p>In order for VTechWorks to reproduce, translate, and distribute your submission worldwide, you must agree to the following terms.</p>

<p>NON-EXCLUSIVE DISTRIBUTION LICENSE</p>

<p>By signing and submitting this license, you (the author(s) or copyright owner) grant to Virginia Tech's University Libraries (VTUL) permission to store and provide access to your submission (including the abstract).</p>

<p>You agree that VTUL may, without changing the content, translate the submission to any medium or format for the purpose of preservation.</p>

<p>You also agree that VTUL may keep more than one copy of this submission for purposes of security, backup and preservation.</p>

<p>You represent that the submission is your original work, and that you have the right to grant the rights contained in this license. You also represent that your submission does not, to the best of your knowledge, infringe upon anyone&#39;s copyright.</p>

<p>If the submission contains material for which you do not hold copyright, you represent that you have obtained the unrestricted permission of the copyright owner to grant VTUL the rights required by this license, and that such third-party owned material is clearly identified and acknowledged within the text or content of the submission.</p>

<p>If the submission is based upon work that has been sponsored or supported by an agency or organization other than Virginia Tech, you represent that you have fulfilled any right of review or other obligations required by such contract or agreement.</p>

<p>VTUL will clearly identify your name(s) as the author(s) or owner(s) of the submission, and will not make any alteration, other than as allowed by this license, to your submission.</p>

<h2>Permissions to Reproduce a Likeness</h2>
<p>VTechWorks contains images and video recordings of Virginia Tech presentations and events. The following policies govern reproduction of a person’s likeness. </p>
<ul>
<li>Virginia Tech faculty, staff, and students automatically agree to let Virginia Tech capture their likenesses under their agreements with the university upon employment and matriculation. Therefore, permission to film members of the Virginia Tech community is not required at university-related events, although such permission can be requested as a courtesy.</li>
<li>For events including non-Virginia Tech individuals, release forms signed by any speaker who features prominently on the recording must be deposited with the recording itself. Any such recording unaccompanied by a release form will be withdrawn from VTechWorks.</li>
<li>For non-Virginia Tech individuals who are minors, a completed media release form must be on file before any medium is created. The minor’s parent or legal guardian must sign the media release form along with the minor.</li>
</ul>

<h2>File Size Policies</h2>

<p>VTechWorks does not currently place restrictions on file size or the number of files that can be deposited. However, VTechWorks reserves the right to refuse to ingest materials whose volume would present a strain on its resources. In many cases, grant- or department-funded projects provide a budget for storage, preservation and access; in these cases, VTechWorks may be able to provide more storage for a nominal fee.</p>

<h2>Amendment and Withdrawal Policies</h2>
<ul>
<li>If you would like to make a change to an item you yourself have deposited, you can do so at any time. We recommend, however, that you add an errata note or create a new version of the file instead of deleting the original file; this will ensure that any links to your original file do not break and that all versions of all files are preserved.</li>
<li>File names should never be changed after files are uploaded to VTechWorks, as this will change the URL to that file.</li>
<li>Theses and dissertations in VTechWorks have been approved for deposit by the graduate school and cannot be changed, withdrawn, or embargoed after deposit without the approval of the dean: write <a href="mailto:grads@vt.edu">grads@vt.edu</a> to request the change.</li>
</ul>

<h2 id ="restrictedEmbargoed">Restricted and Embargoed Content</h2>
<h3 id="embargoedContent">Embargoed Content</h3>
<p>Apart from Virginia Tech theses and dissertations, which are submitted through the Virginia Tech Graduate School and whose embargo periods vary according to the policy of the VT Graduate School, users who deposit content directly into VTechWorks may choose to embargo their content. To embargo content is to make it private for a designated period of time, which may range from a few months to several years. Although placing an embargo will make content files private for a designated time period, the metadata that describes these content files will remain viewable and searchable.</p>
<p>Authors or content creators often embargo their content due to publisher requirements, since many journal publishers require an embargo of anywhere from 6 months to 3 years, or because they wish to publish a book, author a paper based on research data, or apply for patent protection. In such cases, users or their proxies may submit works through the VTechWorks submission form and enter an embargo period of their choice, or, if they have transferred their copyright to a journal publisher, enter an embargo period specified by the journal publisher.</p>
<p>The screenshot shown below demonstrates shows how to assign an embargo period using the VTechWorks submission form. To keep one’s content files private until a certain date, enter the date on which it should become public. Each file you add can have a different embargo period. As indicated previously, information in the item record such as title, author, and abstract will be public and searchable, and only the associated file(s) will be inaccessible. Use the pop-up calendar to pick a date or type the date in manually. Examples: 2020-04-01 (file will become public on April 1, 2020); 2020-04 (file will become public on April 1, 2020); or 2020 (file will become public on January 1, 2020).</p>
<p>If you wish, you may also indicate the reason you would like the file to remain private for a certain period - this is helpful for VTechWorks staff who are managing the item. The embargo reason is not shown anywhere in the public record of the item: it is for administrator use only. Examples: Awaiting publication, Applying for a patent.</p>
<img src="{$theme-path}images/embargoContent.png" />

<p>For information about embargoes for items that are not theses or dissertations, e.g., journal articles, presentations, book chapters, etc., please email <a href="mailto:vtechworks@vt.edu">vtechworks@vt.edu</a>. For information about embargo periods involving Virginia Tech theses and dissertations, please contact the Virginia Tech Graduate School at <a href="mailto:grads@vt.edu">grads@vt.edu</a>, or speak to a representative from your academic department.</p>
<h3>Restricted Content</h3>
<p>Restricted content includes VTechWorks content whose access is limited to certain VTechWorks users or user groups, such as Virginia Tech faculty, staff, students, and/or campus network users. For information about content that is made private for a designated period of time, see <a href="#embargoedContent">Embargoed Content</a>.</p>
<p>The most common restricted content in VTechWorks are Virginia Tech theses and dissertations authored prior to 2011, as well as selected theses and dissertations authored after 2011. Because the authors of these pre-2011 theses and dissertations did not consent to make their theses or dissertations publicly available online - this option was not available prior to 2011 - many of these theses and dissertations are currently restricted to Virginia Tech faculty, staff, students, and campus network users. VTechWorks staff, primarily in response to user inquiries, continuously strives to contact authors of restricted theses and dissertations to obtain consent to make their content publicly available.</p>
<p>Regarding content other than theses and dissertations - such as journal articles, book chapters, presentations, images, videos, etc. - VTechWorks authors, creators, or proxies may request that their content be restricted to selected VTechWorks users, such as VTechWorks administrators and co-authors, or designated user groups, such as their departmental colleagues, classmates, or on-campus users (VTechWorks staff may create custom user groups with custom access and submission privileges). It should be noted that VTechWorks staff cannot set a time period for how long an item is restricted; the item is either restricted in the system or it isn’t.  If authors wish to restrict access to their works for a certain period of time, they may select the embargo option (see <a href="#restrictedEmbargoed">Restricted and Embargoed Content</a>).</p>
<p>If you have submitted or plan to submit content to VTechWorks that you would like to restrict to selected users or user groups, please contact VTechWorks staff at <a href="mailto:vtechworks@vt.edu">vtechworks@vt.edu</a>.</p>

<h2>Requesting Access to Restricted Content</h2>
<p>A significant portion of VTechWorks content is not publicly available to certain VTechWorks users. To elaborate, many pre-2011 Virginia Tech theses and dissertations, most of which are still available in print, are restricted to Virginia Tech faculty, staff, students, and Virginia Tech’s campus network users. As indicated in the <a href="#restrictedEmbargoed">Restricted and Embargoed Content</a> section, if authors of journal articles, presentations, book chapters, and various other content types may decide to restrict access to their works for a certain period of time, they may select the embargo option.</p>
<p>To release these items publicly, VTechWorks staff must obtain the content creator’s written consent. If you encounter a restricted item that you would like to access, begin by clicking on the item, an example of which is shown below:</p>
<img src="{$theme-path}images/LockedItem.png" />

<p>Clicking on the restricted item will take you to a request form: please fill out the information in this form, specifically your email address. Your response will be sent to VTechWorks staff and we will attempt to contact the item’s creator and ask that he or she release the item. If you have questions about the form or about the process of requesting restricted content, please contact <a href="mailto:vtechworks@vt.edu">vtechworks@vt.edu</a></p>
<p>If VTechWorks staff cannot locate the item’s author, or if the item’s author does not grant permission to release the digital version of the item, the item can still be requested via InterLibrary Loan. Please contact your local library about its interlibrary loan program.</p>
<img src="{$theme-path}images/RequestItem.png" />

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
		If you would like to deposit an item you authored that has been previously published, such as a journal article, you should check your publishing contract to see if you have retained the right to deposit (or “self-archive”) the work in an institutional repository. You can also visit the <a href="http://www.sherpa.ac.uk/romeo/search.php">Sherpa/RoMEO database</a> to find out the deposit policies of your journal or publisher.</p> 
		<h3>Some Definitions of Versions</h3>		
		<ul>
		<li>Draft Version = A work in preparation that has not yet been submitted to a scholarly publisher</li>
		<li>Submitted Version = A work submitted to a scholarly publisher that has not yet been refereed or peer-reviewed: a "pre-print"</li>
		<li>Accepted Version = A work accepted for publication by a scholarly publisher that has been refereed or peer-reviewed: a "post-print"</li>
		<li>Publisher's Version = A work that has been refereed or peer-reviewed, copy-edited, typeset, and formatted by a scholarly publisher: an "offprint," "reprint," or "proof"</li>
		</ul>
		<h3>Some Definitions of SHERPA/RoMEO Journal and Publisher Policies</h3>
		<ul>
		<li>"Green" journals and publishers allow you to deposit a draft version, submitted version (pre peer review), or accepted version (post peer review) of your work; you might also be allowed or required to deposit the publisher's version (final typeset PDF)</li>
		<li>"Blue" journals and publishers allow you to deposit an accepted version (post peer review) of your work; you might also be allowed or required to deposit the publisher's version (final typeset PDF)</li>
		<li>"Yellow" journals and publishers allow you to deposit a draft version or submitted version (pre peer review) of your work</li>
		<li>"White" journals and publishers do not allow you to deposit any version of your work</li>	
		<li>"Gray" journals and publishers are those whose policies concerning deposit are unknown</li>			
		</ul>
		<p>If you are in doubt as to whether you may deposit a work, write <a href="mailto:vtechworks@vt.edu">vtechworks@vt.edu</a> for a consultation. 
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
		
<h2>Linking to Work</h2> 

<p>One of the key benefits of VTechWorks is that it provides stable, permanent links (“handles”) to research. Here’s how to share stable links to your work.</p>

<ul> 
<li>Be sure to share the link in the item record that appears in this format: <a href="http://hdl.handle.net/10919/71357">http://hdl.handle.net/10919/71357</a> This link is guaranteed to be permanent and stable, even if VTechWorks moves or changes its domain name in the future.</li> 
<li>Direct links to files (such as <a href="http://vtechworks.lib.vt.edu/bitstream/handle/10919/56486/40246_2015_Article_42.pdf">http://vtechworks.lib.vt.edu/bitstream/handle/10919/56486/40246_2015_Article_42.pdf</a>) are relatively stable but are not guaranteed to persist, since the depositor might choose to delete the file or change its name, which will change the URL. We discourage depositors from deleting files or changing file names, but it has been known to happen.</li> 
<li>Do not copy and share the link from your browser’s address bar; these links (which might include “vtechworks.lib.vt.edu”) are relatively stable but are not guaranteed to resolve if VTechWorks moves or makes changes to its domain name.</li>
<li>Be especially sure not to copy and share the link from your browser’s address bar if you have signed in from off-campus; such links contain the word “ezproxy,” which indicates that you have signed in as a Virginia Tech user in order to access restricted resources. Non-Virginia Tech users will not be able to see these items.</li> 

</ul>
		
								
  </xsl:template>
</xsl:stylesheet>
