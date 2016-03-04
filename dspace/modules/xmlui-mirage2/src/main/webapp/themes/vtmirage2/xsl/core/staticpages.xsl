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
		<p>
Ask library staff to help with determining the rights status of your scholarly work, with creating accounts and collections, and more at 
					<a>
						<xsl:attribute name="href">
							<xsl:text>http://j.mp/vtechworks-service</xsl:text>
						</xsl:attribute>
						<xsl:text>http://j.mp/vtechworks-service</xsl:text>
					</a>
				<br />
				<br />
					Sign up for VTechWorks News at 
					<a>
						<xsl:attribute name="href">
							<xsl:text>https://groups.google.com/a/vt.edu/forum/#!forum/vtechworks-g/join</xsl:text>
						</xsl:attribute>
						<xsl:text>https://groups.google.com/a/vt.edu/forum/#!forum/vtechworks-g/join</xsl:text>
					</a>
					 to get monthly reports of planned features and new content.
			
		</p>
		  <h1>VTechWorks Metadata</h1>

  <p>VTechWorks uses the <a href="http://dublincore.org/documents/dcmi-terms/">Dublin Core</a> and <a href="http://www.ndltd.org/standards/metadata">NDLTD</a> metadata standards to enhance the discoverability, comprehensibility, and use of VTechWorks resources. VTechWorks has also developed custom metadata fields, as well as leveraged encoding guidelines from the <a href="http://www.tdl.org/wp-content/uploads/2009/04/tdl-descriptive-metadata-guidelines-for-etd-v1.pdf">Texas Digital Library</a> and <a href="https://www.loc.gov/standards/mods/mods-outline-3-5.html">MODS</a> metadata standards, to improve the description of VTechWorks resources.</p>
<p>
  To access VTechWorks' descriptive, technical, and administrative metadata encoding guidelines, visit the link below:
  <br />
  <br />
<a href="http://hdl.handle.net/10919/64779">VTechWorks Metadata Guidelines</a>
<br />
<br />
These guidelines are updated regularly; for questions or comments, please contact <a href="mailto:vtechworks@vt.edu">vtechworks@vt.edu</a>.</p>
  </xsl:template>
</xsl:stylesheet>